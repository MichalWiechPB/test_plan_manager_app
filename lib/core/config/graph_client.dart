import 'package:dio/dio.dart';

typedef TokenProvider = Future<String> Function();

class GraphClientException implements Exception {
  final int? statusCode;
  final String message;
  final dynamic data;

  GraphClientException({
    this.statusCode,
    required this.message,
    this.data,
  });

  @override
  String toString() =>
      'GraphClientException(statusCode: $statusCode, message: $message, data: $data)';
}

class GraphClient {
  final Dio _dio;
  final TokenProvider _tokenProvider;
  final String _siteId;
  final String _baseUrl;

  GraphClient({
    required Dio dio,
    required TokenProvider tokenProvider,
    required String siteId,
    String baseUrl = 'https://graph.microsoft.com/v1.0',
  })  : _dio = dio,
        _tokenProvider = tokenProvider,
        _siteId = siteId,
        _baseUrl = baseUrl;

  // --- Helpers ---

  String _listItemsUrl(String listId) =>
      '$_baseUrl/sites/$_siteId/lists/$listId/items';

  String _listItemFieldsUrl(String listId, String itemId) =>
      '$_baseUrl/sites/$_siteId/lists/$listId/items/$itemId/fields';

  String _listItemUrl(String listId, String itemId) =>
      '$_baseUrl/sites/$_siteId/lists/$listId/items/$itemId';

  Future<Map<String, String>> _defaultHeaders({
    bool withConsistencyLevel = false,
    bool json = false,
    bool withIfMatchAny = false,
  }) async {
    final token = await _tokenProvider();

    return {
      'Authorization': 'Bearer $token',
      if (json) 'Content-Type': 'application/json',
      if (withConsistencyLevel) 'ConsistencyLevel': 'eventual',
      if (withIfMatchAny) 'If-Match': '*',
    };
  }

  Never _throwIfNotSuccess(Response response) {
    if (response.statusCode == null ||
        response.statusCode! < 200 ||
        response.statusCode! >= 300) {
      throw GraphClientException(
        statusCode: response.statusCode,
        message: 'Graph API error',
        data: response.data,
      );
    }
    throw StateError('This line should be unreachable');
  }

  Future<List<dynamic>> getListItems({
    required String listId,
    bool expandFields = true,
    Map<String, dynamic>? queryParameters,
    bool withConsistencyLevel = true,
  }) async {
    final headers = await _defaultHeaders(
      withConsistencyLevel: withConsistencyLevel,
    );

    final qp = <String, dynamic>{
      if (expandFields) r'$expand': 'fields',
      ...?queryParameters,
    };

    final res = await _dio.get<Map<String, dynamic>>(
      _listItemsUrl(listId),
      queryParameters: qp.isEmpty ? null : qp,
      options: Options(
        headers: headers,
      ),
    );

    if (res.statusCode == null ||
        res.statusCode! < 200 ||
        res.statusCode! >= 300) {
      throw GraphClientException(
        statusCode: res.statusCode,
        message: 'Graph API getListItems error',
        data: res.data,
      );
    }

    final value = res.data?['value'];
    if (value is List) {
      return value;
    }

    throw GraphClientException(
      statusCode: res.statusCode,
      message: 'Unexpected response shape (no "value" array)',
      data: res.data,
    );
  }

  Future<Map<String, dynamic>> createListItem({
    required String listId,
    required Map<String, dynamic> body,
  }) async {
    final headers = await _defaultHeaders(json: true);

    final res = await _dio.post<Map<String, dynamic>>(
      _listItemsUrl(listId),
      data: body,
      options: Options(
        headers: headers,
      ),
    );

    if (res.statusCode == null ||
        res.statusCode! < 200 ||
        res.statusCode! >= 300) {
      throw GraphClientException(
        statusCode: res.statusCode,
        message: 'Graph API createListItem error',
        data: res.data,
      );
    }

    return res.data ?? <String, dynamic>{};
  }

  Future<Map<String, dynamic>> updateListItemFields({
    required String listId,
    required String itemId,
    required Map<String, dynamic> fields,
  }) async {
    final headers =
    await _defaultHeaders(json: true, withIfMatchAny: true);

    final res = await _dio.patch<Map<String, dynamic>>(
      _listItemFieldsUrl(listId, itemId),
      data: fields,
      options: Options(
        headers: headers,
      ),
    );

    if (res.statusCode == null ||
        res.statusCode! < 200 ||
        res.statusCode! >= 300) {
      throw GraphClientException(
        statusCode: res.statusCode,
        message: 'Graph API updateListItemFields error',
        data: res.data,
      );
    }

    return res.data ?? <String, dynamic>{};
  }

  Future<Map<String, dynamic>> updateListItemRaw({
    required String listId,
    required String itemId,
    required Map<String, dynamic> body,
  }) async {
    final headers =
    await _defaultHeaders(json: true, withIfMatchAny: true);

    final res = await _dio.patch<Map<String, dynamic>>(
      _listItemFieldsUrl(listId, itemId),
      data: body,
      options: Options(headers: headers),
    );

    if (res.statusCode == null ||
        res.statusCode! < 200 ||
        res.statusCode! >= 300) {
      throw GraphClientException(
        statusCode: res.statusCode,
        message: 'Graph API updateListItemRaw error',
        data: res.data,
      );
    }

    return res.data ?? <String, dynamic>{};
  }

  Future<void> deleteListItem({
    required String listId,
    required String itemId,
  }) async {
    final headers = await _defaultHeaders(withIfMatchAny: true);

    final res = await _dio.delete<dynamic>(
      _listItemUrl(listId, itemId),
      options: Options(headers: headers),
    );

    if (res.statusCode == null ||
        res.statusCode! < 200 ||
        res.statusCode! >= 300) {
      throw GraphClientException(
        statusCode: res.statusCode,
        message: 'Graph API deleteListItem error',
        data: res.data,
      );
    }
  }
}

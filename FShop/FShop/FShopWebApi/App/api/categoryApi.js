﻿define(['durandal/system', 'services/logger', 'services/global', 'knockout', 'plugins/http', 'services/scripts'],
    function (system, logger, global, ko, http, scripts) {
        var service = global.serviceUrl + 'categories';

        var vm = {
            get: get,
            getById: getById,
            update: update,
            deleteById: deleteById
        };

        return vm;

        function get(observableList) {
            var promise = http.get(service);

            return promise.then(function(data) {
                observableList(data);
            }).fail(function(error) {
                logger.logError("Error while loading categorys: " + scripts.jsonMessage(error), null, "Get Category List", true);
            });
        }

        function update(category) {
            return http.post(service, category);
        }

        function getById(id) {
            return http.get(service, id);
        }

        function deleteById(id) {
            return http.delete(service, id);
        }
    });
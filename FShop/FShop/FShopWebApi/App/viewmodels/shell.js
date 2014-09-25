define(['plugins/router', 'durandal/app', 'knockout', 'services/logger', 'services/navigating', 'services/global', 'api/productApi'],
    function (router, app, ko, logger, navigating, global, productApi) {

        var vm = {
            products: global.products,
            departments: global.departments,
            selectDepartment: global.selectDepartment,
            isHomeActive: global.isHomeActive,
            router: router,
            search: function () {
                //It's really easy to show a message box.
                //You can add custom options too. Also, it returns a promise for the user's response.
                app.showMessage('Search not yet implemented...');
            },
            activate: function (routeInfo) {
                router.map([
                    { route: ['', 'cat/:id'], title: 'Catalog', moduleId: 'viewmodels/catalog', nav: true },
                    { route: ['product/:id', 'product/:id/:cat'], title: 'Product', moduleId: 'viewmodels/product', nav: true },
                    { route: 'cart', title: 'Shopping Cart', moduleId: 'viewmodels/shoppingCart', nav: true }
                ]).buildNavigationModel();

                return router.activate();
            }
        };

        vm.onDeartmentLoad = ko.computed(function () {
            var items = vm.departments();
            vm.departments([]);
            for (var i = 0; i < items.length; i++) {                
                items[i].isActive = ko.observable(false);
            }
            vm.departments(items);
        }, vm);
        
        return vm;
    });
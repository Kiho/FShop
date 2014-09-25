$(function () {

    //var uri = 'api/categories';

    //$.getJSON(uri)
    //    .done(function (data) {
    //        $.each(data, function (key, item) {
    //            $('<tr><td>' + (key + 1) + '</td><td>' + item.Name + '</td><td>' + item.Description + '</td></tr>')
    //                .appendTo($('#cars tbody'));
    //        });
    //    });

    var uri = 'api/products/';

    $.getJSON(uri)
        .done(function (data) {
            $.each(data, function (key, item) {
                $('<tr><td>' + (key + 1) + '</td><td>' + item.Name + '</td><td>' + item.ID + '</td><td>' + item.Price + '</td></tr>')
                    .appendTo($('#cars tbody'));
            });
        });
});

  var makeAutocomplete = {
        source: function (request, response) {
            $('#Code').val(); //clear code value
            $.ajax({
                url: myUrl,
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                dataType: 'json', //What kind of Result is expected. (Ex json, xml, etc)
                data: "{'searchItem':'" + request.term + "'}",
                success: function (data) {
                    var item = [];
                    var len = data.d.length;
                    for (var i = 0; i < len; i++) {
                        var obj = { name: data.d[i].MakeReport, code: data.d[i].MakeCode };
                        item.push(obj);
                    }
                    response(item);
                }
            })
        },
        focus: function (event, ui) {
            $(this).val(ui.item.name);
            return false;
        },
        select: function (event, ui) {
            $('#Code').val(ui.item.code);
            $('#Name').val(ui.item.name);
            $(this).val(ui.item.name);
            return false;
        },
        open: function () {
            $(this).removeClass("ui-corner-all").addClass("ui-corner-top");
        },
        close: function () {
            $(this).removeClass("ui-corner-top").addClass("ui-corner-all");
        },
        minLength: 2,
        delay: 250
    };

    var renderList = function (ul, item) {
        return $("<li></li>")
                .data("item.autocomplete", item)
                .append("<a>" + item.name + "</a>")
                .appendTo(ul);
    };

    $("#OtherMake").autocomplete(makeAutocomplete).data("autocomplete")._renderItem = renderList;
    $("#MakeName").autocomplete(makeAutocomplete).data("autocomplete")._renderItem = renderList;
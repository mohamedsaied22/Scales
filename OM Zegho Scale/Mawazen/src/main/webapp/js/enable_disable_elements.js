function enable_disable_elements() {
    $("#manual_weight").click(function () {
        $("#auto").val("false");
        $("#weight_field").removeAttr("disabled");
        $("#weight_field").val("");
        $("#weight_field").focus();
    });
    $("#automatic_weight").click(function () {
        $("#auto").val("true");
        $("#weight_field").attr("disabled", "disabled");
        $("#weight_field").val("");
        $.ajax({
            url: "http://localhost:8080/MawazenClient/WeightValue",
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Headers': 'Origin, X-Requested-With, Content-Type, Accept'
            },
            type: "POST",
            beforeSend: function(xhr){
                xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
                xhr.setRequestHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
                },
            success: function (result, status, xhr) {
                $("#weight_field").val(result);
            }
        });

    });


}
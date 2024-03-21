var timeoutInMiliseconds = 20 * 60 * 1000;
var timeoutId;

function startTimer() {
    // window.setTimeout returns an Id that can be used to start and stop a timer
    timeoutId = window.setTimeout(doInactive, timeoutInMiliseconds)
}

function stopTimer() {
    window.clearTimeout(timeoutId);
}

function doInactive() {
    // does whatever you need it to actually do - probably signs them out or stops polling the server for info
    //alert("لقد تخطيت الفترة المسموحة من فضلك اعد تسجيل الدخول");
    //window.location = "http://localhost:8080/Mawazen/";
    var ip = "192.168.1.50";
    var port = "9999";
    bootbox.alert({
        message: "لقد تخطيت الفترة المسموحة من فضلك اعد تسجيل الدخول",
        locale: 'ar',
        closeButton: false,
        callback: function () {
            window.location = "http://" + ip + ":" + port + "/Mawazen/";

        }
    });
    stopTimer();
}

function resetTimer() {
    stopTimer();
    startTimer();
}

function setupTimers() {
    document.addEventListener("mousemove", resetTimer, false);
    document.addEventListener("mousedown", resetTimer, false);
    document.addEventListener("keypress", resetTimer, false);
    document.addEventListener("touchmove", resetTimer, false);

    startTimer();
}

var isMatching = function (firstField, secondField) {
    if (firstField.trim() === secondField.trim()) {
        return true;
    } else {
        return false;
    }
}
var changePassword = function () {
    if ($(".needs-validation")[0].checkValidity() === true && isMatching($("#new_password").val(), $("#re_new_password").val())) {
        $.ajax({
            url: "Controller",
            data: {
                n: "13",
                current_password: $("#current_password").val(),
                new_password: $("#new_password").val(),
                re_new_password: $("#re_new_password").val()
            },
            type: "POST",

            success: function (result, status, xhr) {
                if (result == 1) {
                    success("تم تغيير كلمة المرور", "");

                    $("#change_password_form").trigger("reset");
                    $("#current_password").removeClass("is-invalid");
                    $("#new_password").removeClass("is-invalid");
                    $("#re_new_password").removeClass("is-invalid");
                    $("#current_password").removeClass("is-valid");
                    $("#new_password").removeClass("is-valid");
                    $("#re_new_password").removeClass("is-valid");
                } else if (result == 0) {
                    error("لم يتم تغيير كلمة المرور", "برجاء التأكد من كلمة المرور الحالية");
                    $("#current_password").addClass("is-invalid");
                    $("#new_password").removeClass("is-invalid");
                    $("#re_new_password").removeClass("is-invalid");
                    $("#current_password").removeClass("is-valid");
                    $("#new_password").addClass("is-valid");
                    $("#re_new_password").addClass("is-valid");
                }
                $(".needs-validation").removeClass("was-validated");

            }
        });
        $(".needs-validation").addClass("was-validated");
    } else {
        if (!isMatching($("#new_password").val(), $("#re_new_password").val())) {
            error("لم يتم تغيير كلمة المرور", "برجاء التأكد من توافق كلمتى المرور");
            $("#current_password").removeClass("is-invalid");
            $("#new_password").addClass("is-invalid");
            $("#re_new_password").addClass("is-invalid");
            $("#current_password").addClass("is-valid");
            $("#new_password").removeClass("is-valid");
            $("#re_new_password").removeClass("is-valid");
        }
    }


}

$(document).ready(function () {
    $("#demo").click(function () {
        $("#content_place").load("demo.jsp", function () {
            $("#demo_sumbit").click(function () {

                if ($(".needs-validation")[1].checkValidity() === true) {
                    $("#demo_sumbit").attr("disabled", true);
                    $.ajax({
                        url: "Controller",
                        data: {
                            n: "3",
                            first_weight: $("#weight_field").val(),
                            client: $("#client").val(),
                            //ship: $("#ship").val(),
                            goods: $("#goods").val(),
                            vechile_num: $("#vechile_num").val(),
                            maqtura_num: $("#maqtura_num").val(),
                            auto: $("#auto").val()
                        },
                        type: "POST",

                        success: function (result, status, xhr) {
                            $("#content_place").load("weight_card.jsp?n=" + result, function () {
                                print_weight_card("print.jsp?n=" + result);
                            });
                        }
                    });
                }
                $(".needs-validation").addClass("was-validated");

            });
            enable_disable_elements();
        });

    });
    $("#demo2").click(function () {
        $("#content_place").load("demo2.jsp", function () {
            $("#operation").change(function () {
                $("#first_weight_info").load("first_weight_info.jsp", {"operation": $("#operation").val()});
            });

            $("#demo2_submit").click(function () {

                if ($(".needs-validation")[1].checkValidity() === true) {
                    $("#demo2_submit").attr("disabled", true);
                    $.ajax({
                        url: "Controller",
                        data: {
                            n: "4",
                            second_weight: $("#weight_field").val(),
                            operation: $("#operation").val(),
                            auto: $("#auto").val()
                        },
                        type: "POST",

                        success: function (result, status, xhr) {
                            $("#content_place").load("weight_card.jsp?n=" + result, function () {
                                print_weight_card("print.jsp?n=" + result);
                            });
                        }
                    });
                }
                $(".needs-validation").addClass("was-validated");

            });
            enable_disable_elements();
        });

    });
    $("#tax").click(function () {
        $("#content_place").load("safety_tax.jsp", function () {
            $("#operation").change(function () {
                $("#first_weight_info").load("first_weight_info.jsp", {"operation": $("#operation").val()});
            });

            $("#tax_submit").click(function () {

                if ($(".needs-validation")[1].checkValidity() === true) {
                    $("#tax_submit").attr("disabled", true);
                    $.ajax({
                        url: "Controller",
                        data: {
                            n: "14",
                            tax: $("#tax_field").val(),
                            operation: $("#operation").val()
                        },
                        type: "POST",

                        success: function (result, status, xhr) {
                            $("#tax_submit").attr("disabled", false);
                            $("#first_weight_info").load("first_weight_info.jsp", {"operation": $("#operation").val()});
                            $(".needs-validation").removeClass("was-validated");
                        }
                    });
                }
                $(".needs-validation").addClass("was-validated");

            });
        });

    });
    $("#create_user").click(function () {
        $("#content_place").load("create_user.jsp", function () {
            $("#new_user_submit").click(function () {

                if ($(".needs-validation")[1].checkValidity() === true) {
                    $("#new_user_submit").attr("disabled", true);
                    $.ajax({
                        url: "Controller",
                        data: {
                            n: "7",
                            name: $("#name").val(),
                            password: $("#password").val(),
                            username: $("#username").val(),
                            role: $("#role").val()
                        },
                        type: "POST",

                        success: function (result, status, xhr) {
                            $(".needs-validation").removeClass("was-validated");
                            $(".needs-validation").trigger("reset");
                            $("#new_user_submit").attr("disabled", false);
                        }
                    });
                }
                $(".needs-validation").addClass("was-validated");
            });
        });
    });
    $("#create_client").click(function () {
        $("#content_place").load("create_client.jsp", function () {
            $("#new_client_submit").click(function () {

                if ($(".needs-validation")[1].checkValidity() === true) {
                    $("#new_client_submit").attr("disabled", true);
                    $.ajax({
                        url: "Controller",
                        data: {
                            n: "9",
                            client: $("#client").val()
                        },
                        type: "POST",

                        success: function (result, status, xhr) {
                            $(".needs-validation").removeClass("was-validated");
                            $(".needs-validation").trigger("reset");
                            $("#new_client_submit").attr("disabled", false);
                        }
                    });
                }
                $(".needs-validation").addClass("was-validated");
            });
        })
    });
    $("#create_ship").click(function () {
        $("#content_place").load("create_ship.jsp", function () {
            $("#new_ship_submit").click(function () {

                if ($(".needs-validation")[1].checkValidity() === true) {
                    $("#new_ship_submit").attr("disabled", true);
                    $.ajax({
                        url: "Controller",
                        data: {
                            n: "11",
                            ship: $("#ship").val()
                        },
                        type: "POST",

                        success: function (result, status, xhr) {
                            $(".needs-validation").removeClass("was-validated");
                            $(".needs-validation").trigger("reset");
                            $("#new_ship_submit").attr("disabled", false);
                        }
                    });
                }
                $(".needs-validation").addClass("was-validated");
            });
        })
    });
    $("#create_goods").click(function () {
        $("#content_place").load("create_goods.jsp", function () {
            $("#new_goods_submit").click(function () {

                if ($(".needs-validation")[1].checkValidity() === true) {
                    $("#new_goods_submit").attr("disabled", true);
                    $.ajax({
                        url: "Controller",
                        data: {
                            n: "10",
                            goods: $("#goods").val()
                        },
                        type: "POST",

                        success: function (result, status, xhr) {
                            $(".needs-validation").removeClass("was-validated");
                            $(".needs-validation").trigger("reset");
                            $("#new_goods_submit").attr("disabled", false);
                        }
                    });
                }
                $(".needs-validation").addClass("was-validated");
            });
        })
    });
    $("#opening_balance").click(function () {
        $("#content_place").load("opening_balance.jsp", function () {
            $("#opening_balance_submit").click(function () {

                if ($(".needs-validation")[1].checkValidity() === true) {
                    $("#opening_balance_submit").attr("disabled", true);
                    $.ajax({
                        url: "Controller",
                        data: {
                            n: "12",
                            goods: $("#goods").val(),
                            client: $("#client").val(),
                            opening_balance: $("#opening_balance_").val()
                        },
                        type: "POST",

                        success: function (result, status, xhr) {
                            $(".needs-validation").removeClass("was-validated");
                            $(".needs-validation").trigger("reset");
                            $("#opening_balance_submit").attr("disabled", false);
                        }
                    });
                }
                $(".needs-validation").addClass("was-validated");
            });
        })
    });
    /*$("#vehicle").click(function () {
        $("#content_place").load("vehicle.jsp", function () {
            sortTableNow('mytable');
            filterTable('search_field', 'mytable_body');
            $("tr").hover(function () {
                $(this).find('.p').removeClass("invisible");
            }, function () {
                $(this).find('.p').addClass("invisible");
            });
            $(".fa-print").click(function () {
                var id = $(this).attr("operation_id");
                $("#content_place").load("weight_card.jsp?n=" + id, function () {
                    print_weight_card("print.jsp?n=" + id);
                });
            });
        });
    });*/
    $("#vehicle_report").click(function () {
        $("#content_place").load("date_vehicle_report.jsp", function () {
            dateRangePicker();

            $("#preview_submit").click(function () {
                let startDate = $("#startDate").val();
                //var startTime = $("#startTime").val();
                let endDate = $("#endDate").val();
                //var endTime = $("#endTime").val();
                $("#preview_content").load("date_vehicle_report_preview.jsp", {
                    startDate: startDate,
                    //startTime: startTime,
                    endDate: endDate,
                    //endTime: endTime
                }, function () {
                    sortTableNow('mytable');
                    filterTable('search_field', 'mytable_body');
                    $("tr").hover(function () {
                        $(this).find('.p').removeClass("invisible");
                    }, function () {
                        $(this).find('.p').addClass("invisible");
                    });
                    $(".fa-print").click(function () {
                        var id = $(this).attr("operation_id");
                        $("#content_place").load("weight_card.jsp?n=" + id, function () {
                            print_weight_card("print.jsp?n=" + id);
                        });
                    });
                });
            });
        });
        /*$("#content_place").load("vehicle.jsp", function () {
            sortTableNow('mytable');
            filterTable('search_field', 'mytable_body');
            $("tr").hover(function () {
                $(this).find('.p').removeClass("invisible");
            }, function () {
                $(this).find('.p').addClass("invisible");
            });
            $(".print").click(function () {
                var id = $(this).attr("operation_id");
                $("#content_place").load("weight_card_money_receive.jsp?n=" + id, function () {
                    $(".card").hover(function () {
                        $(this).find(".fa-print").removeClass("invisible");

                    }, function () {
                        $(this).find(".fa-print").addClass("invisible");
                    });
                    print_card();
                });
                /*$("#content_place").load("weight_card.jsp?n=" + id, function () {
                    print_weight_card("print.jsp?n=" + id);
                });*/
        /*});
    });*/
    });
    $("#amount_report").click(function () {
        $("#content_place").load("amount_report.jsp", function () {
            dateRangePicker();

            $("#preview_submit").click(function () {
                var startDate = $("#startDate").val();
                var startTime = $("#startTime").val();
                var endDate = $("#endDate").val();
                var endTime = $("#endTime").val();
                $("#preview_content").load("amount_report_preview.jsp", {
                    startDate: startDate,
                    startTime: startTime,
                    endDate: endDate,
                    endTime: endTime
                }, function () {
                    //chartPie();
                });
            });
        });
    });
    $("#client_balance_report").click(function () {
        $("#content_place").load("client_balance.jsp", function () {
            sortTableNow('mytable');
            filterTable('search_field', 'mytable_body');

        });
    });


    setupTimers();
});

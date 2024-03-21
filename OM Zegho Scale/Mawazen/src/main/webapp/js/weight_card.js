function print_weight_card(url) {
    $("#print_card").hover(function () {
        $(".fa-print").removeClass("invisible");
    }, function () {
        $(".fa-print").addClass("invisible");
    });

    $(".fa-print").click(function () {
        //printDiv("section-to-print");
        //printReport("section-to-print");
        printElem("section-to-print", url);

        //window.print();
    });

}
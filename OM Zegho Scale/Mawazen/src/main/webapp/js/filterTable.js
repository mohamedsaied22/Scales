/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var filterTable = function (search_field_id,table_id) {

    $("#"+search_field_id).ready(function () {
        $("#"+search_field_id).keyup(function () {
            var value = $(this).val().toLowerCase();
            $("#"+table_id+" tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
            });
        });

    });



};




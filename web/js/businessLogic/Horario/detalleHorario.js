/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {

    pageSetUp();

    // PAGE RELATED SCRIPTS

    // switch style change
    $('input[name="checkbox-style"]').change(function () {
        //alert($(this).val())
        $this = $(this);

        if ($this.attr('value') === "switch-1") {
            $("#switch-1").show();
            $("#switch-2").hide();
        } else if ($this.attr('value') === "switch-2") {
            $("#switch-1").hide();
            $("#switch-2").show();
        }

    });


});
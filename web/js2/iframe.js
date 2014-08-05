$(document).ready(function (){
    $("#deposito").load(function (){
        var variframe = $("#deposito").contents().find("body table asasa").text().split("\n"); 
        var output = variframe;
        $.each(output, function (index, value){
            callOutput($.trim(index), $.trim(value));
        });
    });
    function callOutput(index, value){
        if(value != '')
            alerta("["+ index + "]"+ value);
        $("ul").append('');
    };
});


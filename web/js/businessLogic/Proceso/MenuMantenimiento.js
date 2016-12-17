/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


 $(document).ready(function () {
                $('.li2a').removeClass('active');
                $('.li2a').addClass('active');
                $('.li1a').click(function () {
                    $(this).addClass('active');
                    $('.li2a').removeClass('active');
                    $('.li3a').removeClass('active');
                });
                $('.li2a').click(function () {
                    $(this).addClass('active');
                    $('.li1a').removeClass('active');
                    $('.li3a').removeClass('active');
                });
                $('.li3a').click(function () {
                    $(this).addClass('active');
                    $('.li2a').removeClass('active');
                    $('.li1a').removeClass('active');
                });
            });
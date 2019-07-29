              $("[data-toggle=dropdown]").parent().hover(
            function(){
                console.log("进入");
                $(this).children(".haveBottom").css({
                    display:"block"
                });
            },
            function(){
                console.log("移出");
                $(this).children(".haveBottom").css({
                    display:"none"
                });

            },
        );


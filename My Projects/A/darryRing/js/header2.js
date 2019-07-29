$()=>{
//header下拉
	$.ajax({
		type:"get",
		url:"header.html"
	}).then(html=>{
		document.getElementById("header").innerHTML=html;
		//关注DR下拉
        $("[data-toggle=dropdown]").parent().hover(
            function(){
                //console.log("进入");
                $(this).children(".haveBottom").css({
                    display:"block"
                });
            },
            function(){
                //console.log("移出");
                $(this).children(".haveBottom").css({
                    display:"none"
                });

            },
        );
		//手机官网下拉
        $(".wapWeb").hover(
            function(){
                //console.log("进入");
                $(this).children(".wapBottom").css({
                    display:"block"
                });
            },
            function(){
                //console.log("移出");
                $(this).children(".wapBottom").css({
                    display:"none"
                });
            },
        );
		//中文简体下拉
        $(".language").hover(
            function(){
                $(this).children("#changeLang").css({
                    display:"block"
                });
            },
            function(){
                $(this).children("#changeLang").css({
                    display:"none"
                });
            },
        );
		//天猫下拉
        $(".tmall").hover(
            function(){
                $(this).children(".tmallLink").css({
                    display:"block",
                }),
				$(this).children(".tmallLink a label").css({
                     // decoration:"underline",
					 // color: "#c57d5c";
                });
            },
            function(){
                $(this).children(".tmallLink").css({
                    display:"none"
                });
            },
        );
        //身份证提示信息
        $("#sfzConfirm")
			.hover(
				function(){
					$(this).next(".notice").css({
						display:"block",
					})
				},
				function(){
					$(this).next(".notice").css({
						display:"none"
					});
				},
			)
			.focus(
				function(){
					$(this).attr({
						placeholder:"",
					}),
					$(this).next(".notice").css({
						display:"none"
					})
				}
			)
			.blur(
				function(){
					$(this).attr({
						placeholder:"请输入身份证号验证真爱承诺"
					})
				}
			);
		//店铺显示
        $(".shops").hover(
            function(){
                $(this).children(".shop").css({
                    display:"block",
                });
                $(this).children(".showShop").css({
                    border: "1px solid #c57d5c",
                    borderBottom: "1px solid white",
                    backgroundColor: "#fff"
                });
            },
            function(){
                $(this).children(".shop").css({
                    display:"none"
                });
                $(this).children(".showShop").css({
                    border: "",
                    borderBottom: "",
                    backgroundColor: ""
                });
            },
        );
        // //导航DR
        // $("[data-toggle=nav]").parent().hover(
        //     function(){
        //         console.log("进入");
        //         $(this).children("#DrNavSub").css({
        //             display:"block"
        //         });
        //     },
        //     function(){
        //         console.log("移出");
        //         $(this).children("#DrNavSub").css({
        //             display:"none"
        //         });
        //     },
        // );
        // //DR品牌文化
        // $("[data-toggle=nav]").parent().hover(
        //     function(){
        //         console.log("进入");
        //         $(this).children("#cultureNavSub").css({
        //             display:"block"
        //         });
        //     },
        //     function(){
        //         console.log("移出");
        //         $(this).children("#cultureNavSub").css({
        //             display:"none"
        //         });
        //     },
        // );
        // //探索DR
        // $("[data-toggle=nav]").parent().hover(
        //     function(){
        //         console.log("进入");
        //         $(this).children("#exploreNavSub").css({
        //             display:"block"
        //         });
        //     },
        //     function(){
        //         console.log("移出");
        //         $(this).children("#exploreNavSub").css({
        //             display:"none"
        //         });
        //     },
        // );

        $("[data-toggle=nav]").parent().hover(
            function(){
                console.log("进入");
                $(this).children(".navSub").css({
                    display:"block"
                });
            },
            function(){
                console.log("移出");
                $(this).children(".navSub").css({
                    display:"none"
                });
            },
        );

	})
//页面mouse进入移出

});
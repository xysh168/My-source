(()=>{
//header下拉
	ajax({
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
		//nav——导航DR、DR品牌文化、探索DR——下拉功能
        $("[data-toggle=nav]").parent().hover(
            function(){
                $(this).children(".navSub").css({
                    display:"block"
                });
            },
            function(){
                $(this).children(".navSub").css({
                    display:"none"
                });
            },
        );
		//nav——求婚钻戒、爱的礼物——图片切换功能
        $("[data-toggle=img]").on("mouseenter",function(){
                $(this).addClass("active")
					   .siblings().removeClass("active");
				var id=$(this).attr("href");
				$(id).css({zIndex:10})
					 .siblings().css({zIndex:0});
            }
        );
		//页头按系列搜索
		$("#searchAll").click(function(){
			window.location.href="ringlist.html";
		})
		$("[data-toggle=img]").on("click",function(){
			//console.log($(this).children("p"));
			window.open('ringlist.html');

		})
        //个人中心显示隐藏
        // $(".userName").hover(
        //     function(){
        //         $("#userLogin").css({display:"block"});
        //     },
        //     function(){
        //         $("#userLogin").css({display:"none"});
        //
        //     },
        // )
        //欢迎
        $.ajax({
            type:"get",
            url:"./data/login/isLogin.php",
            success:function (data) {
                if(data.ok==1){
                    $("#login").css({display:"none"});
                    $("#regLink").css({display:"none"});
                    $("#welcome").css({display:"block"});
                    $(".userName").html("欢迎&nbsp;"+data.uname);
                }
            },
            error:function () {
                alert("网络故障，请检查！")
            }

        })
        //退出
        $("#logout").click(function (e) {
            e.preventDefault();
            $.ajax({
                type:"get",
                url:"./data/login/logout.php",
                success:function () {
                    location.reload(true);
                    $("#login").css({display:"block"});
                    $("#regLink").css({display:"block"});
                    $("#welcome").css({display:"none"});

                },
                error:function () {
                    alert("网络故障，请检查");
                }
            })
        })
		//购物车跳转
		$("#goCart").click(function(){
			location.href="cart.html";
		})

        //登录连接跳转
        $("#login").click(function(e){
            e.preventDefault();
            location="login.html?back="+location.href;
        })

        $(".shop a").attr("href","shoplist.html");

	})


})();
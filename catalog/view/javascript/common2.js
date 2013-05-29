$(document).ready(function () {
    function tabSwitch(m, c, p) {
        $(m).mouseover(function (e) {
            var t = e.target;
            if (p != t.tagName) {
                t = $(t).parents(p);
            }
            $(t).addClass("on").siblings().removeClass("on");
            $(c).eq($(m).index(this)).addClass("selected").siblings().removeClass("selected");
        });
    }
    tabSwitch(".tab_class .tablist li", ".nplist", "LI");

    $(".item-ul_aa").find("li").each(function (i) {
        var tab = $(this).find("item-ul li a");
        var con = $(this).find(".hidden");
        $(this).hover(
			function () {
			    tab.addClass("nav_on");
			    con.addClass("selected");
			},
			function () {
			    tab.removeClass("nav_on");
			    con.removeClass("selected");
			}
		);
    });
	
});
$(document).ready(function() {
	$('.pro_info .other .button').wrapInner('<span class="hover"></span>').css('textIndent','0')
		.each(function () {
		$('span.hover').css('opacity', 0).hover(function () {
			$(this).stop().fadeTo(450, 1);
		}, function () {
			$(this).stop().fadeTo(450, 0);
		});
	});
});




$(function(){
	//add new jquery
	$('.submenu').hover(
		function(){
			$(this).prev().addClass('nobg');
			$(this).children('a').addClass('current');
			$(this).find('.submenuwrap').slideDown();
			/*if($(this).find('.submenuwrap').is(":animated")){
				$(this).find('.submenuwrap').stop(false,true);
			}*/
			//add jquery no slideDown || slideUp
		},
		function(){
			$(this).prev().removeClass('nobg');
			$(this).children('.current').removeClass('current');
			//$(this).find('.submenuwrap').slideUp('fast');
			if($(this).find('.submenuwrap').is(":animated")){
				$(this).find('.submenuwrap').stop(true,true);
			}
			//$(this).find('.submenuwrap').hide();
			$(this).find('.submenuwrap').slideUp('fast');
		}
	);
	
	$(".nivo-controlNav a:even").addClass(".a111");//ou
	$(".nivo-controlNav a:odd").addClass(".a222");//ji
	//$(".nivo-controlNav a").hover(	function() 
	//{$(this).addClass("ddd");}, function(){$(this).removeClass("ddd");}
	//);
	
	
	function tab2(o1,o2,c,t1,t2,a,b){
		var count=o1.size()-1;
		var now;
		var TimeInterval;
		o1.each(function(i){
			$(this).mouseover(function(){
				o2.hide().eq(i).show();
				o1.removeClass(c);
				$(this).addClass(c);
				window.clearInterval(TimeInterval);
			}).mouseout(function(){
				now = i+1;
				TimeInterval = window.setInterval(changeimage,t1);
			});
			//chuyihua
			if ($(this).hasClass(c)) {
				$(this).addClass(c);
				o2.hide().eq(i).show();
				now = i+1;
			}
		})
		
		TimeInterval = window.setInterval(changeimage,t1);
		function changeimage(){
			if(now>count)now=0;
			o2.hide().eq(now).stop().fadeTo(0,a).fadeTo(t2,b);
			o1.removeClass(c).eq(now).addClass(c);
			now++;
		}
	}
	
	tab2($(".d2 .aa"),$(".d2 .bb"),"on",2500,800,0.1,1);
	
	
	$(function() {
		 $("#powered .img").mouseover(function() {								   
			$("#powered .img").each(function() {			   
			   $(this).get(0).style.filter = "alpha(opacity=50)";
			   $(this).get(0).style.opacity = "0.5";
			});
		  
		    $(this).get(0).style.filter = "alpha(opacity=100)";
		    $(this).get(0).style.opacity = "1";
		  
		 }).mouseout(function() {
		    $("#powered .img").each(function() {
		      $(this).get(0).style.filter = "alpha(opacity=100)";
		      $(this).get(0).style.opacity = "1";
		    });
		 });
	 });
	
	$('#tips_p').click(function(){
		$("#tips_div").slideToggle(400);
	});
	$('#tips_p_1').click(function(){
		$("#tips_div_1").slideToggle(400);
	});
	$('#tips_p_2').click(function(){
		$("#tips_div_2").slideToggle(400);
	});
	$('#tips_p_3').click(function(){
		$("#tips_div_3").slideToggle(400);
	});
	$('#tips_p_4').click(function(){
		$("#tips_div_4").slideToggle(400);
	});
	
	$('.exit').click(function(){
	    $('.cart_content').slideUp();	
		$("#cart").removeClass("up");
		$("#cart").addClass("down");
	});
	
	$(".home_pro ul li").hover(	
	   function() {
		   $(this).addClass("hover");
	   }, 
	   function(){
		   $(this).removeClass("hover");
	   }
	);
	
	
	$('.p_new_list').hover(function(){
		$('.more_hot_news_list').slideDown(30);
		$(".more_hot_news_list").addClass('a111');
	},function(){
			$('.more_hot_news_list').slideUp();
		}
	)
	
	
})
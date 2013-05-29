 $(function(){
	  $('#slider li').eq(0).show();
	  var len = $('#num span').length;
	  var index = 0;
	  $('#num span').mouseover(function(){
		  index = $('#num span').index(this);
		  picShow(index);
	  })
	  $('#box').hover(function(){
		  if(playPic){
			  clearInterval(playPic);
		  }
	  },function(){
		  playPic = setInterval(function(){
			  picShow(index);
			  index++;
			  if(index==len){index=0}
		  },3000)
	  })
	  var playPic = setInterval(function(){
		  picShow(index);
		  index++;
		  if(index==len){index=0}
	  },3000)
	  function picShow(i){
		  $('#slider li').eq(i).stop(true,true).fadeIn().siblings().fadeOut();
		  $('#num > span').eq(i).addClass('on').siblings().removeClass('on');
	  }
  });
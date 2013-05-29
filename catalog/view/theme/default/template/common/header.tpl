<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />

<link href="catalog/view/theme/default/stylesheet/common.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/index.css" rel="stylesheet" type="text/css" />

<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>


<script type="text/javascript" src="catalog/view/javascript/common2.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jd.js"></script>



<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<div class="top w">
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"  class="png" /></a></div>
  <?php } ?>
  <?php echo $language; ?>
 </div>
 

 <?php
 			
		
		

$nav='<div class="nav_bg">';
	$nav.='  <p class="w nav">';
	$nav.='     <a href="'.$menu_home_href.'"  title="'.$Menu_Home.'">'.$Menu_Home.'</a>';
	$nav.='     <a href="'.$menu_about_href.'" title="'.$Menu_About.'">'.$Menu_About.'</a>';
	$nav.='     <a href="'.$menu_news_href.'" title="'.$Menu_News.'">'.$Menu_News.'</a>';
	$nav.='     <a href="'.$menu_articles_href.'" title="'.$Menu_Articles.'">'.$Menu_Articles.'</a>';
	$nav.='     <a href="'.$menu_tips_href.'" title="'.$Menu_Tips.'">'.$Menu_Tips.'</a>';
	$nav.='     <a href="'.$menu_products_href.'" title="'.$Menu_Products.'">'.$Menu_Products.'</a>';
	$nav.='     <a href="'.$menu_buy_href.'" title="'.$Menu_Buy.'">'.$Menu_Buy.'</a>';
	$nav.='     <a href="'.$menu_inquiry_href.'" title="'.$Menu_Inquiry.'">'.$Menu_Inquiry.'</a>';
	$nav.='  </p>';
	$nav.='</div>';
echo $nav;
  ?>
  <div class="jd">
  <div class="jd_div">
     <div id="box" class="box">
         <ul id="slider" class="slider">
            <li class="li_1"><img src="catalog/view/theme/default/image/jd1.jpg" /></li>
            <li class="li_2"><img src="catalog/view/theme/default/image/jd2.jpg" /></li>
         </ul>
         <div id="num" class="num">
            <span class="one on">1</span>
            <span class="one">2</span>
         </div>
    </div>
  </div>
</div>



<div class="jd_bottom">
   <div class="w">White Knight......no compromise for exceptional quality</div>
</div>


     
<div id="notification"></div>

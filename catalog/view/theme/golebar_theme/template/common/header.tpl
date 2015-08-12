<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/golebar_theme/stylesheet/stylesheet.css" rel="stylesheet">

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="catalog/view/javascript/swiper/css/swiper.min.css">

<!-- Swiper JS -->
<script src="catalog/view/javascript/swiper/js/swiper.min.js"></script>

<link rel="stylesheet" href="//cdn.jsdelivr.net/hint.css/1.3.2/hint.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/hint.css/1.3.2/hint.min.css">

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">

<nav id="top">
  <div class="container">
     <?php echo $language; ?> 
      <a href="http://mp.weixin.qq.com/s?__biz=MzA3NTMyODA4Mw==&mid=205372945&idx=1&sn=995448c5bae6c4e968f13af0ae8af2f7&scene=4#wechat_redirect"><img src="./catalog/view/theme/golebar_theme/image/wechat.png" height:20px; width="20px;" id="top-social-btn" style="margin-top: 5px; float: left;"></a>
      <a href="http://www.weibo.com/u/5436925047"><img src="./catalog/view/theme/golebar_theme/image/weibo.png" height:20px; width="20px;" id="top-social-btn" style="margin-top: 5px; float: left;"></a>
      <a href="https://www.facebook.com/golebar?fref=ts"><img src="./catalog/view/theme/golebar_theme/image/facebook.png" height:20px; width="20px;" id="top-social-btn" style="margin-top: 5px; float: left;"></a><div style="margin-top: 5px; float: left;">关注我们</div>
    <div id="top-links" class="nav pull-right" style="padding:0;">
      <ul class="list-inline">

        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" style=""></i> <span class="hidden-xs hidden-sm hidden-md">
	        <?php if ($logged) { ?>
	        	<span>欢迎您回来, <?php echo $firstname; ?></span>
	        <?php } else { ?>
	        	<?php echo $text_register; ?>/<?php echo $text_login; ?>
	        <?php } ?>
	        </span> <span class="caret" style="margin-bottom: 5px;"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart" style=" padding-top:10px;"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
		  
        <!--<li><a href="<?php echo $contact; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-phone"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_contact; ?></span></a></li>-->
        <li style="margin:0; padding:0;" class="hidden-md hidden-sm hidden-xs">
			<div id="top-deal" style="padding-top:8px;">
				<!--<img src="catalog/view/theme/golebar_theme/image/deal.png" style="margin-top:-10px";>-->
				<a href="<?php echo $register; ?>" title="<?php echo $text_checkout; ?>">
					<span class="hidden-xs hidden-sm hidden-md">注册参与秒杀限抢</span>
				</a>
			</div>
		</li>
      </ul>
    </div>
  </div>
</nav>
<div style="background-color:white; height:30px;"></div>
<header>
  <div class="container">
    <div class="row" id="nav-logo" style="padding-bottom: 15px;">
      <div class="col-md-3">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" height="64px" width="190px"/></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-md-7">
		  
		  <div class="col-md-11" style="padding:0; margin:0;">
			  <!-- <span id="search-top">海量香辣卤味零食！购满$45你的邮费我们包了!</span> -->
			  <a href="http://golebar.com/index.php?route=product/search&search=%E9%B8%AD%E8%84%96" style="color:rgb(52,152,219);"><span style="padding-left:10px;">鸭脖</span></a><a href="http://golebar.com/index.php?route=product/product&product_id=632&search=%E6%B5%AA%E5%91%B3%E4%BB%99" style="color:rgb(52,152,219);"><span style="padding-left:7px;">浪味仙</span></a><a href="http://golebar.com/index.php?route=product/search&search=%E4%B9%9D%E9%98%B3" style="color:rgb(52,152,219);"><span style="padding-left:7px;">九阳</span></a><a href="http://golebar.com/index.php?route=product/search&search=%E8%B1%86%E4%B9%B3" style="color:rgb(52,152,219);"><span style="padding-left:7px;">豆乳</span></a><a href="http://golebar.com/index.php?route=product/search&search=%E6%9F%93%E5%8F%91%E5%89%82" style="color:rgb(52,152,219);"><span style="padding-left:7px;">染发剂</span></a><a href="http://golebar.com/index.php?route=product/category&path=63_75" style="color:rgb(52,152,219);"><span style="padding-left:7px;">生活百货</span></a>
			  <?php echo $search; ?>
			  
		  </div>
      </div>
      <div class="col-md-2">
		  <?php echo $cart; ?>
	  </div>
    </div>
  </div>
</header>
<?php if ($categories) { ?>
<div id="#navmenu" class="hidden-xs hidden-sm">
  <nav id="menu" class="navbar">
	  <div class="container">
		  <div class="col-md-3 col-sm-1 hidden-sm hidden-xs" style="background-color:#ff306b; height:40px; line-height:40px; color:white; font-size:14px; padding:0; margin:0; width:18%;">
			  <i class="fa fa-bars" style="padding-left:23px; padding-right:10px;"></i><span class="hidden-xs hidden-sm"><?php echo $text_category; ?></span>
		  </div>
			<div class="navbar-header"><span id="category" class="visible-xs" style="color:gray; text-shadow:none;"><?php echo $text_category; ?></span>
			  <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse col-md-9 col-sm-12" style="width:82%;" id="navbar-small">
			  <ul class="nav navbar-nav">
				<li><a href="<?php echo $picTitle1[1]; ?>"><?php echo $picTitle1[0]; ?></a></li>
			  	<li><a href="<?php echo $picTitle2[1]; ?>"><?php echo $picTitle2[0]; ?></a></li>
			  	<li><a href="<?php echo $picTitle3[1]; ?>"><?php echo $picTitle3[0]; ?></a></li>
			  	<li><a href="<?php echo $picTitle4[1]; ?>"><?php echo $picTitle4[0]; ?></a></li>
			  </ul>
			  <div style="float:right; line-height:40px; color:#ff2a69; font-size:14px;">全场满49包邮！</div>
			</div>
	  </div>
  </nav>
</div>
<?php } ?>
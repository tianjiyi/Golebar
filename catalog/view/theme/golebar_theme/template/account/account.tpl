<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    	<column id="column-right" class="col-sm-9 hidden-xs" style="background-image: url(/catalog/view/theme/golebar_theme/image/userAccount.jpg); height:296px; background-repeat: no-repeat; background-size: cover;"></column>
    	<?php echo $column_right; ?></div>
      <?php echo $content_bottom; ?></div>
    
</div>

<br>
<div class="col-xs-12 hidden-lg hidden-md hidden-sm">
	
	<column id="column-left" class="col-xs-12">
    <div class="list-group">
    <a href="http://52.26.58.65/index.php?route=account/account" class="list-group-item">我的账户</a>
    <a href="http://52.26.58.65/index.php?route=account/edit" class="list-group-item">编辑账户</a> <a href="http://52.26.58.65/index.php?route=account/password" class="list-group-item">更新密码</a>
    <a href="http://52.26.58.65/index.php?route=account/address" class="list-group-item">地 址 薄</a> <a href="http://52.26.58.65/index.php?route=account/wishlist" class="list-group-item">收藏列表</a> <a href="http://52.26.58.65/index.php?route=account/order" class="list-group-item">历史订单</a> <a href="http://52.26.58.65/index.php?route=account/reward" class="list-group-item">奖励积分</a>   
    <a href="http://52.26.58.65/index.php?route=account/logout" class="list-group-item">退出账户</a>
  </div>
  </column>
  
</div>
<?php echo $footer; ?>
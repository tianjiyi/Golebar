<div class="col-md-3 hidden-sm hidden-xs" id="nav-list" style="width: 18%; margin:0; padding: 0; height:100%; background-color: white;">
		<?php $var_index = 0;?>
		<?php if ($categories) { ?>
			<?php foreach ($categories as $category) { ?>
				<div class="nav-list-each">
					<?php if ($category['children']) { ?>
						<li style="list-style-type:none; margin-left:20px; margin-top:0.9%; margin-bottom:0.93%; font-size:13px; color:#383838; font-weight:500; "><?php echo $category['name']; ?></li>
						
						<div style="margin-left:20px; margin-bottom:5px; margin-right:78px;" id="top-categories">
							<?php foreach ($category['children'] as $children) { ?>
									<span style="font-size:12px; color:#9b9c9d; padding-right:3px;" id="top-categories_span"><a href="<?php echo $children['href']; ?>" style="color:#9b9c9d;" id="top-categories_a">
									<?php $child_title = explode('(', $children['name']); ?>
									<?php echo $child_title[0]; ?></a></span>
							<?php } ?>
						</div>
						<?php } ?>
						<?php if ($var_index!=5) {?>
							<div style="border-top:1px solid #e6e7e8; height:1px; margin-left:15px; margin-right:15px;"></div>
						<?php } ?>
					</div>
					<?php $var_index++; ?>
			<?php } ?>
		<?php } ?>
</div>

<div id="slideshow<?php echo $module; ?>" class="owl-carousel col-md-9 slide-change" style="border-radius: 0px !important; opacity: 1; margin:0; padding: 0; width: 82%; float: right; margin-bottom:25px;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item" style="float:right; border-radius: 0px !important;">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" width="935px" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" max-width="935px" />
    <?php } ?>
  </div>
  <?php } ?>
</div>

<script type="text/javascript">
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 6000,
	singleItem: true
});
</script>
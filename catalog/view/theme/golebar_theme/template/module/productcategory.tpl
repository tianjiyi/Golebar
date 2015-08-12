<div class="col-xs-12 hidden-sm hidden-xs" style="padding:0; margin-top: 20px; height: 400px;">
	<span class="col-xs-12" style="height:35px; line-height: 35px; font-size: 16px; color:#ff2a69; padding: 0; border-bottom: 2px solid #ff2a69; padding-left: 10px;"><?php echo $category_title; ?><span style="font-size: 12px; float: right; color:#babbbc;"><a href="<?php echo $category_titlelink; ?>" style="font-size: 12px; float: right; color:#babbbc;">更多...</a></span></span>
	<div class="col-xs-12" style="height:365px; padding: 0; background-color: white;">
		<div class="col-xs-2" style=" height: 100%; padding: 0; width: 18%">
			<div id="products-category-mobile" style="height:40%; width: 70%; border-bottom: 1px solid #eeeff0; margin: 0px auto; line-height: 30px;">
				<div style="padding-top:27px; padding-left:5%;">
				<?php $var_index = 0; ?>
				<?php foreach ($selected_titles as $selected_title) { ?>
					<span style="font-size:12px; padding-right:13px;">
					<a href="<?php echo $selected_links[$var_index];?>" style="color:#646566;"><?php echo $selected_title; ?></a>
					</span>
					<?php $var_index++; ?>
				<?php } ?>
				</div>
			</div>
			
			<div style="height:60%; padding:0;">
				<div class="col-xs-3" style="padding:0; width:15%; height:65px; background-color: #ff2a69; margin-top: 15px; line-height: 4.5px; color: white;" align="center">
					<p style="padding-top: 10px;">新</p>
					<p>品</p>
					<p>上</p>
					<p>架</p>
				</div>
				
				<div class="col-xs-9" style="font-size:12px; padding:0; height:30px; width: 85%; padding-right: 10%; padding-top: 14%;" align="center">
					<a href="<?php echo $image2_link;?>" style="color:#646566;"><?php echo $image2_title; ?></a>
				</div>
				
				<div class="col-xs-12" align="center">
					<a href="<?php echo $image2_link;?>" style="color:#646566;"><img src="<?php echo $left1_bottom; ?>" height="140px" width="140px"/></a>
				</div>
			</div>
		</div>
		<a href="<?php echo $ad_title[2]; ?>"><div class="col-xs-3" style="height: 100%; padding:0; width: 27%; background-image: url(<?php echo $left2;?>); background-repeat: no-repeat; background-size: cover; ">
			
			<div style="height: 60px; position: absolute; bottom:0; width: 100%; font-size: 18px; background-color: rgba(255,255,255,0.7); padding-left: 15px; padding-top: 14px; color: black;"><b><?php echo $ad_title[0]; ?></b><br><p style="font-size: 13px; color:gray;"><?php echo $ad_title[1]; ?></p></div>
		</div></a>
		
		<div class="col-xs-2" style="height: 100%; padding:0; width: 16%;">
			<div style="height: 50%; border-bottom: 1px solid #eeeff0;">
				<div style="padding-top:10px; margin-left: 25px; margin-right: 25px;">
					<span style="font-size:12px; float:left; padding: 0; width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><?php echo $products[0]['name']; ?></span><br>
					<span style="font-size:12px; float:left; color:#ff2a69; padding: 0;"> <?php echo $products[0]['price']; ?></span><br>
				</div>
				<div class="image" align="center" style="padding:0; padding-top: 5px;">
					<a href="<?php echo $products[0]['href']; ?>" target="_blank">
						<img src="<?php echo $products[0]['thumb']; ?>" alt="<?php echo $products[0]['name']; ?>" title="<?php echo $products[0]['name']; ?>" class="img-responsive" height="115px" width="115px" />
					</a>
				</div>
			</div>
			<div style="height: 50%;">
				<div style="padding-top:10px; margin-left: 25px; margin-right: 25px;">
					<span style="font-size:12px; float:left; padding: 0; width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><?php echo $products[1]['name']; ?></span><br>
					<span style="font-size:12px; float:left; color:#ff2a69; padding: 0px;"> <?php echo $products[1]['price']; ?></span><br>
				</div>
				<div class="image" align="center" style="padding:5px;">
					<a href="<?php echo $products[1]['href']; ?>" target="_blank">
						<img src="<?php echo $products[1]['thumb']; ?>" alt="<?php echo $products[1]['name']; ?>" title="<?php echo $products[1]['name']; ?>" class="img-responsive" height="115px" width="115px" />
					</a>
				</div>
			</div>
		</div>
		<div class="col-xs-3" style="height: 100%; padding:0; width: 23%; border-left: 1px solid #eeeff0; border-right: 1px solid #eeeff0;">
			<div style="margin-left: 15%; margin-right: 15%; padding-top: 30px;" align="left">
				<span style="font-size: 12px;"><?php echo $products[2]['name']; ?></span><br>
				<span style="font-size: 12px; color:#ff2a69;"><?php echo $products[2]['price']; ?></span>
			</div>
			
			<div class="image" align="center" style="padding:25px;">
				<a href="<?php echo $products[2]['href']; ?>" target="_blank">
					<img src="<?php echo $products[2]['thumb']; ?>" alt="<?php echo $products[2]['name']; ?>" title="<?php echo $products[2]['name']; ?>" class="img-responsive" height="235px" width="235px" />
				</a>
			</div>
			
		</div>
		
		<div class="col-xs-2" style="height: 100%; padding:0; width: 16%;">
			<div style="height: 50%; border-bottom: 1px solid #eeeff0;">
				<div style="padding-top:10px; margin-left: 25px; margin-right: 25px;">
					<span style="font-size:12px; float:left; padding: 0; width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><?php echo $products[3]['name']; ?></span><br>
					<span style="font-size:12px; float:left; color:#ff2a69; padding: 0px;"> <?php echo $products[3]['price']; ?></span><br>
				</div>
				<div class="image" align="center" style="padding:5px;">
					<a href="<?php echo $products[3]['href']; ?>" target="_blank">
						<img src="<?php echo $products[3]['thumb']; ?>" alt="<?php echo $products[3]['name']; ?>" title="<?php echo $products[3]['name']; ?>" class="img-responsive" height="115px" width="115px" />
					</a>
				</div>
			</div>
			<div style="height: 50%;">
				<div style="padding-top:10px; margin-left: 25px; margin-right: 25px;">
					<span style="font-size:12px; float:left; padding: 0; width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><?php echo $products[4]['name']; ?></span><br>
					<span style="font-size:12px; float:left; color:#ff2a69; padding: 0px;"> <?php echo $products[4]['price']; ?></span><br>
				</div>
				<div class="image" align="center" style="padding:5px;">
					<a href="<?php echo $products[4]['href']; ?>" target="_blank">
						<img src="<?php echo $products[4]['thumb']; ?>" alt="<?php echo $products[4]['name']; ?>" title="<?php echo $products[4]['name']; ?>" class="img-responsive" height="115px" width="115px" />
					</a>
				</div>
			</div>
		</div>
	</div>
</div>


<!--Only for small view -->

<div class="col-xs-12 hidden-lg hidden-md" style="margin-top:20px; padding: 0;">
	<span class="col-xs-12" style="height:18px; line-height: 18px; font-size: 16px; color:gray; padding: 0; border-left: 4px solid #ff2a69; padding-left: 8px;"><?php echo $category_title; ?><span style="font-size: 12px; float: right; color:#babbbc;"><a href="<?php echo $category_titlelink; ?>" style="font-size: 12px; float: right; color:#babbbc;">更多...</a></span></span>
	<div class="col-xs-12" style="padding: 0; margin-top: 15px; border-top: 2px solid #eeeff0; border-bottom: 2px solid #eeeff0; background-color: white;">
		<div class="col-xs-8" style="height: 150px; padding:0; background-image: url(<?php echo $left2;?>); background-repeat: no-repeat; background-size: cover;"></div>
		<div class="col-xs-4" style="padding: 0;">
			<div id="products-category-xs" style="height: 150px; margin: 0px auto; padding: 0;  line-height: 25px;">
				<div style="padding: 0; padding-top: 26%; padding-left: 6px;">
				<?php $var_index = 0; ?>
				<?php foreach ($selected_titles as $selected_title) { ?>
					<span style="font-size:12px; padding-right:2px;">
					<a href="<?php echo $selected_links[$var_index];?>" style="color:#646566;"><?php echo $selected_title; ?></a>
					</span>
					<?php $var_index++; ?>
				<?php } ?>
				</div>
			</div>
		</div>
		<div class="col-xs-4" style="height: auto; padding:0;">
			<div style="height:150px; padding:0;">
				<div class="col-xs-3" style="position: absolute; padding:0; width:30px; height:auto; background-color: #ff2a69; margin-top: 10px; line-height: 4.5px; color: white; left:0;" align="center">
					<p style="padding-top: 10px;">新</p>
					<p>品</p>
					<p class="hidden-xs">上</p>
					<p class="hidden-xs">架</p>
				</div>
				
				<div class="col-xs-9" style="font-size:12px; padding:0; height:30px; width: 100%; padding-left: 30px; padding-top: 12%;" align="center">
					<a href="<?php echo $image2_link;?>" style="color:#646566;"><?php echo $image2_title; ?></a>
				</div>
				
				<div class="col-xs-12 image" align="center" style="height:auto; position: relative; top: 13%;">	
					<a href=""><img src="<?php echo $left1_bottom; ?>" alt="" title="" class="img-responsive" height="95px" width="95px" /></a>
				</div>
			</div>
		</div>
		
		<?php $var_Index=0; $var_border=1; ?>
		<?php foreach ($products as $product) { ?>
			<?php if($var_Index == 2) { ?>
				<?php $var_border=0; ?>
			<?php } else { ?>
				<?php $var_border=1; ?>
			<?php } ?>
			<div class="col-xs-4" style="padding:0; border-left:<?php echo $var_border; ?>px solid #eeeff0; border-top:1px solid #eeeff0; height:150px;" align="center">
				<div style="padding-top:10px; margin-left: 10px; margin-right: 10px;">

					<div style="font-size:12px; text-align:center; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-size:11px;" algin="center"><?php echo $product['name']; ?></div>
					<div style="font-size:12px; float:center; color:#ff2a69; padding: 0px;"> <?php echo $product['price']; ?></div>
				</div>
				
				<div class="image" align="center" style="height:150px; position: relative;">
					<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" height="90px" width="90px" /></a>
				</div>
			</div>
			<?php $var_Index++; ?>
		<?php }?>
	</div>

</div>
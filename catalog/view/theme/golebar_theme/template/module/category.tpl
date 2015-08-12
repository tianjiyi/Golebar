<div style="height:30px; border-radius: 0px !important;"></div>
<div class="list-group" style="border-top: 3px solid #ff2a69; border-radius: 0px !important;"> 
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
  <?php $ptitle = explode('(', $category['name']); ?>
  <a href="<?php echo $category['children'][0]['href']; ?>" class="list-group-item active" style="font-size:13px; border-radius: 0px !important;"><?php echo $ptitle[0]; ?></a>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
  <?php $ctitle = explode('(', $child['name']); ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item active" style="font-size:12px; border-radius: 0px !important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- <?php echo $ctitle[0]; ?></a>
  <?php } else { ?>
  <?php $ctitle = explode('(', $child['name']); ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item" style="font-size:12px; border-radius: 0px !important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- <?php echo $ctitle[0]; ?></a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <?php $ptitle = explode('(', $category['name']); ?>
  <?php $childNum = 0; ?>
  <?php if (substr( $category['href'], -2) == '59') { ?>
  		<?php $childNum = 81; ?>
  <?php } ?>
  <?php if (substr( $category['href'], -2) == '60') { ?>
  		<?php $childNum = 65; ?>
  <?php } ?>
  <?php if (substr( $category['href'], -2) == '61') { ?>
  		<?php $childNum = 67; ?>
  <?php } ?>
  <?php if (substr( $category['href'], -2) == '62') { ?>
  		<?php $childNum = 71; ?>
  <?php } ?>
   <?php if (substr( $category['href'], -2) == '63') { ?>
  		<?php $childNum = 75; ?>
  <?php } ?>
  <?php if (substr( $category['href'], -2) == '64') { ?>
  		<?php $childNum = 78; ?>
  <?php } ?>
  <a href="<?php echo $category['href'].'_'.$childNum; ?>" class="list-group-item" style="font-size:13px; border-radius: 0px !important;"><?php echo $ptitle[0]; ?></a>
  <?php } ?>
  <?php } ?>
</div>

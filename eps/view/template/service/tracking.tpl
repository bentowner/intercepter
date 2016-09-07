			<div class=".col-lg-12 col-md-12 col-sm-6">
			<legend><?php echo $heading_title; ?></legend></div>
			
			<div class=".col-lg-12 col-md-12 col-sm-6">
<?php if ($error_warning) { ?>
				<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($success) { ?>
				<div class="success"><?php echo $success; ?></div>
<?php } ?>
		
          <br>
        <div class="table-responsive">
			<table class="table table-bordered">
			  <thead>
			    <tr>
			      <td class="left"><?php echo $column_date_added; ?></td>
			      <td class="center">By</td>
			      <td class="left"><?php echo $column_comment; ?></td>
			    </tr>
			  </thead>
			  <tbody>
			    <?php if ($histories) { ?>
			    <?php foreach ($histories as $history) { ?>
			    <tr>
			      <td class="left"><?php echo $history['date_added']; ?></td>
			      <td class="center"><?php echo $history['user']; ?></td>
			      <td class="left" style="background-color: #DFF5F2;" ><font color= rgb(2,45,79);><?php echo nl2br($history['comment']); ?></font></td>
			    </tr>
			    <?php } ?>
			    <?php } else { ?>
			    <tr>
			      <td class="center" colspan="3"><?php echo $text_no_results; ?></td>
			    </tr>
			    <?php } ?>
			  </tbody>
			</table>
			
	<div class="pagination"><?php echo $pagination; ?></div>
			  </div>
      </div><!-- end tab-->
      
</div>      
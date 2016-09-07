
<div class=".col-lg-12 col-md-12 col-sm-6">
			<legend><?php echo $heading_title; ?></legend>
			<div align="center">
			<span  >Operation Notes - <i>posted for customer review.</i></span><br>
			</div>
			<br>
			<div class=".col-lg-5 col-md-5 col-sm-5">
				
				<div class="row">
				<legend>Systems Notes</legend>
	<?php if ($notes_system) { ?>
				<?php echo nl2br($notes_system); ?>
	<?php } else { ?>
           		No System generated Notes.      
	<?php } ?>
				</div>
				<br>
				<div class="row">
				<legend>Destination Clauses</legend>
	<?php if ($service_portofdest_clause) { ?>
					<span><?php echo nl2br($service_portofdest_clause); ?></span>
	<?php } ?>
				</div>
				
			</div>
			<div class=".col-lg-6 col-md-6 col-sm-6 pull-right">
			<div class="row">
			<legend>Operations Notes</legend>
			<?php echo nl2br($notes_ops); ?>
			
			<?php if ($notes_ops_list) { ?>
			 <input type="hidden" id="note" name="note" value="<?php echo $notes_ops_list; ?>" />
		   
	       
	<?php } ?>
	</div>
	<div class="row">
			<textarea type="text" name="notes_ops_add" id="notes_ops_add" class="form-control" ><?php echo $notes_ops_add; ?></textarea>
			<a href="<?php echo $updateNotes; ?>" data-toggle="tooltip" title="<?php echo $button_add_note; ?>" class="btn btn-primary" ><i class="fa fa-pencil"></i></a>
	</div>
				
			</div>      
</div>


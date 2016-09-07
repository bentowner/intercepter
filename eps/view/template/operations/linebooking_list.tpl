<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
          <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
      <form action="<?php echo ($lcltransittime_link) ?>" method="post" id="lcltransittime">
      
        <table class="list">
          <thead>
            <tr>
              <td ></td>
              <td class="left">Approved</td>
              <td class="left"><?php if ($sort == 'ref') { ?><a href="<?php echo $sort_ref; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_ref; ?></a><?php } else { ?><a href="<?php echo $sort_ref; ?>"><?php echo $column_ref; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'booking') { ?><a href="<?php echo $sort_booking; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_booking; ?></a><?php } else { ?><a href="<?php echo $sort_booking; ?>"><?php echo $column_booking; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'vessel') { ?><a href="<?php echo $sort_vessel; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_vessel; ?></a><?php } else { ?><a href="<?php echo $sort_vessel; ?>"><?php echo $column_vessel; ?></a>  <?php } ?></td>
			  	
			  <td></td>	
			  <?php if (isset($column_action)) { ?>
              <td class="right"><?php echo $column_action; ?></td>
              <?php } ?> 
              </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td></td>
              <td></td>
              <td><input type="text" name="filter_ref" value="<?php echo $filter_ref ?>" size="7"/></td>
			  <td><input type="text" name="filter_booking" value="<?php echo $filter_booking ?>" size="7"/></td>
              <td><input type="text" name="filter_vessel" value="<?php echo $filter_vessel ?>" size="7"/></td>
               	
             <?php if (isset($column_status)) { ?> 
              <td><select name="filter_status">
                  <option value="*"></option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (!is_null($filter_status) && !$filter_status) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>	  
			  <td><select name="filter_approved">
                  <option value="*"></option>
                  <?php if ($filter_approved) { ?>
                  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_yes; ?></option>
                  <?php } ?>
                  <?php if (!is_null($filter_approved) && !$filter_approved) { ?>
                  <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_no; ?></option>
                  <?php } ?>
                </select></td>
              <?php } ?> 
              
              <?php if (isset($column_action)) { ?> 
              <td align="right"></td>
              <?php } ?> 
              <td></td>	
            </tr>
            <?php if ($linebookings) { ?> <?php foreach ($linebookings as $linebooking) { ?>
            <tr>
            
              <td style="text-align: center;">
              
              <?php if (isset($vessels_link)) { ?>
                <input type="checkbox" name = "dest_code" id="<?php echo ($lcltt_link) ?>" value="<?php echo $vessel['DestCode']; ?>" 
                onClick="this.form.submit();" />
              <?php } else{ ?> 
               <?php if ($linebooking['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $vessel['country_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $vessel['country_id']; ?>" />
                <?php } ?>
              <?php } ?>
              </td> 
              <td  class="left">Yes</td>
              <td class="left"><?php echo $linebooking['ref']; ?></td> 
              <td class="left"><?php echo $linebooking['booking']; ?></td>
              <td class="left"><?php echo $linebooking['vessel']; ?></td>
              <td class="right"><?php foreach ($linebooking['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="10"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function filter() {
	<?php if (isset($insert)) { ?> 
	
	url = 'index.php?route=operations/linebooking&token=<?php echo $token; ?>';
	
	 <?php } ?> 
	 
	var filter_ref = $('input[name=\'filter_ref\']').attr('value');
	var filter_booking= $('input[name=\'filter_booking\']').attr('value');
	var filter_vessel = $('input[name=\'filter_vessel\']').attr('value');
	
	if (filter_ref ) {	url += '&filter_ref=' + encodeURIComponent(filter_ref);	}	
	if (filter_booking ) {	url += '&filter_booking=' + encodeURIComponent(filter_booking);	}
	if (filter_vessel ) {	url += '&filter_vessel=' + encodeURIComponent(filter_vessel);		}
	
	location = url;
}
//--></script>
<script type="text/javascript"><!--
	$('input[name="filter_ref"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
	$('input[name="filter_booking"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
	$('input[name="filter_vessel"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
//--></script> 

 


<script type="text/javascript"><!--
$(document).ready(function() {
	$('#date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script>
<?php echo $footer; ?> 
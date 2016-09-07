<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></div>
    <?php if (isset($insert)) { ?> 
      <div class="buttons"><a onclick="$('form').attr('action', '<?php echo $approve; ?>'); $('form').submit();" class="button"><?php echo $button_approve; ?></a>
      <a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a>
      <a onclick="$('form').attr('action', '<?php echo $delete; ?>'); $('form').submit();" class="button"><?php echo $button_delete; ?></a>
      </div>
    <?php } ?>
    </div>
    <div class="content">
      <form action="<?php echo ($lcltransittime_link) ?>" method="post" id="lcltransittime">
      
        <table class="list">
          <thead>
            <tr>
              <td ></td>
              <td class="left">Approved</td>
              <td class="left"><?php if ($sort == 'cfs') { ?><a href="<?php echo $sort_cfs; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_cfs; ?></a><?php } else { ?><a href="<?php echo $sort_cfs; ?>"><?php echo $column_cfs; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'week') { ?><a href="<?php echo $sort_week; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_week; ?></a><?php } else { ?><a href="<?php echo $sort_week; ?>"><?php echo $column_week; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'last') { ?><a href="<?php echo $sort_last; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_last; ?></a><?php } else { ?><a href="<?php echo $sort_last; ?>"><?php echo $column_last; ?></a>  <?php } ?></td>
			    	
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
              <td><input type="text" name="filter_cfs" value="<?php echo $filter_cfs ?>" size="7"/></td>
			  <td><input type="text" name="filter_week" value="<?php echo $filter_week ?>" size="7"/></td>
              <td><input type="text" name="filter_last" value="<?php echo $filter_last ?>" size="7"/></td>
                	
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
            <?php if ($intermodallp) { ?> <?php foreach ($intermodallp as $intermodallp_detail) { ?>
            <tr>
            
              <td style="text-align: center;">
              
              <?php if (isset($vessels_link)) { ?>
                <input type="checkbox" name = "dest_code" id="<?php echo ($lcltt_link) ?>" value="<?php echo $vessel['DestCode']; ?>" 
                onClick="this.form.submit();" />
              <?php } else{ ?> 
               <?php if ($intermodallp_detail['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $vessel['country_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $vessel['country_id']; ?>" />
                <?php } ?>
              <?php } ?>
              </td> 
              <td  class="left">Yes</td>
              <td class="left"><?php echo $intermodallp_detail['cfs']; ?> </td>
              <td class="left"><?php echo $intermodallp_detail['week']; ?></td>
              <td class="left"><?php echo $intermodallp_detail['last']; ?></td>
              <td class="right"><?php foreach ($intermodallp_detail['action'] as $action) { ?>
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
	
	url = 'index.php?route=maintenance/vessels&token=<?php echo $token; ?>';
	
	 <?php } ?> 
	 
	var filter_cfs = $('input[name=\'filter_cfs\']').attr('value');
	var filter_week = $('input[name=\'filter_week\']').attr('value');
	var filter_last = $('input[name=\'filter_last\']').attr('value');
	
	if (filter_cfs ) {	url += '&filter_cfs=' + encodeURIComponent(filter_cfs);	}	
	if (filter_week ) {	url += '&filter_week=' + encodeURIComponent(filter_week);	}
	if (filter_last ) {	url += '&filter_last=' + encodeURIComponent(filter_last);	}
	
	location = url;
}
//--></script>
<script type="text/javascript"><!--
	$('input[name="filter_cfs"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
	$('input[name="filter_week"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
	$('input[name="filter_last"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
//--></script> 

 


<script type="text/javascript"><!--
$(document).ready(function() {
	$('#date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script>
<?php echo $footer; ?> 
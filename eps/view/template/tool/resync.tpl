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
      <h1><img src="view/image/backup.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#restore').submit();" class="button"><?php echo $button_restore; ?></a><a onclick="$('#backup').submit();" class="button"><?php echo $button_backup; ?></a></div>
    </div>
    <div class="content">
    
     <form action="<?php echo $restore; ?>" method="post" enctype="multipart/form-data" id="restore">
        <table class="form">
          <tr>
            <td>Initalize Sync:</td>
            <td class="buttons"><a onclick="<?php echo $sync; ?>" class="button">Synchronize</a> </td><td>Synchronizes the Web Application to the NVO Desktop Application</td>
          </tr>
         
        </table>
      </form>
      
      <form action="<?php echo $restore; ?>" method="post" enctype="multipart/form-data" id="restore">
        <table class="form">
          <tr>
            <td>Reconcile Process:</td>
            <td class="buttons"><a onclick="<?php echo $reconcile; ?>" class="button">Reconcile</a> </td><td>1.) Completes mutually exclusive transactions <br>2.) Presents conflicting Items for the matching process</td>
          </tr>
         
        </table>
      </form>
      <form action="<?php echo $backup; ?>" method="post" enctype="multipart/form-data" id="backup">
        <table class="form">
          <tr>
            <td>Match items:</td>
            <td><div class="scrollbox" style="margin-bottom: 5px;">
                <?php $class = 'odd'; ?>
                <?php $i=0; ?>
                <?php foreach ($reconcile_items as $reconcile_item) {  ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
               
                <div class="<?php echo $class; ?>">
                  <input type="checkbox" name="recon[]" value="<?php echo $reconcile_item; ?>" checked="checked" />
                  <?php echo "$reconcile_item[$i]"; $i++ ?></div>
                <?php } ?>
               
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
        </table>
       <!-- <?php Print_r ($_SESSION); echo "<p>"; ?> - --> 
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>
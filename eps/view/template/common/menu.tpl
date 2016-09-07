<ul id="menu">
  <li id="dashboard"><a href="<?php echo $home; ?>"><i class="fa fa-dashboard fa-fw"></i> <span><?php echo $text_dashboard; ?></span></a></li>

  <li id="packagedsolution"><a class="parent" ><i class="fa fa-cloud"></i> <span><?php echo $text_packagedsolutions; ?></span></a>
    <ul>
      <li id="cloud_foundation"><a href="#" ><i class="fa fa-cloud"></i> <span><?php echo $text_cloud_foundation; ?></span></a></li>
      <li id="cloud_discovery"><a href="#" ><i class="fa fa-cloud"></i> <span><?php echo $text_cloud_discovery_workshop; ?></span></a></li>
      <li id="cloud_training"><a href="#" ><i class="fa fa-cloud"></i> <span><?php echo $text_cloud_training; ?></span></a></li>
      <li id="hpc_cloud_burst"><a href="#" ><i class="fa fa-cube"></i> <span><?php echo $text_hpc_cloud_burst; ?></span></a></li>
      <li id="vm_migration"><a href="#" ><i class="fa fa-dropbox"></i> <span><?php echo $text_vm_migration; ?></span></a></li>
      <li id="vm_lift_shift"><a href="#" ><i class="fa fa-dropbox"></i> <span><?php echo $text_vm_lift_shift; ?></span></a></li>
      <li id="o365_migration"><a href="#" ><i class="fa fa-user"></i> <span><?php echo $text_o365_migration; ?></span></a></li>


    </ul>
  </li>


    <li id="customsolution"><a class="parent"  href="<?php echo $customsolution; ?>" ><i class="fa fa-cloud"></i> <span><?php echo $text_customsolutions; ?></span></a></li>
    <li id="strategicinit"><a class="parent" ><i class="fa fa-clipboard"></i> <span><?php echo $text_strategicinit; ?></span></a>
      <ul>
       <li><a href="<?php echo $direct_connect; ?>"><?php echo $text_direct_connect; ?></a></li>
        <li><a href="<?php echo $hybrid_cloud; ?>"><?php echo $text_hybrid_cloud; ?></a></li>
        <li><a href="<?php echo $ecx; ?>"><?php echo $text_ecx_enablement; ?></a></li>
      </ul>
    </li>


    <li id="reports"><a class="parent"><i class="fa fa-bar-chart-o fa-fw"></i> <span><?php echo $text_reports; ?></span></a>
    <ul>
      <li><a class="parent"><?php echo $text_service; ?></a>
        <ul>
          <li><a href="<?php echo $report_service_capacity; ?>"><?php echo $text_report_service_capacity; ?></a></li>
        </ul>
      </li>

      <li><a class="parent"><?php echo $text_customer; ?></a>
        <ul>
          <li><a href="<?php echo $report_customer_online; ?>"><?php echo $text_report_customer_online; ?></a></li>
          <li><a href="<?php echo $report_customer_activity; ?>"><?php echo $text_report_customer_activity; ?></a></li>
        </ul>
      </li>
      <li><a class="parent"><?php echo $text_marketing; ?></a>
        <ul>
          <li><a href="<?php echo $report_marketing; ?>"><?php echo $text_marketing; ?></a></li>
          <li><a href="<?php echo $report_affiliate; ?>"><?php echo $text_report_affiliate; ?></a></li>
          <li><a href="<?php echo $report_affiliate_activity; ?>"><?php echo $text_report_affiliate_activity; ?></a></li>
        </ul>
      </li>
    </ul>
  </li>

  <li id="maintenance"><a class="parent"><i class="fa fa-cog fa-fw"></i> <span><?php echo $text_maintenance; ?></span></a>
        <ul>

        <li><a class='parent'><?php echo $text_maint_customer; ?></a>
        	<ul>
        	<li><a href="<?php echo $customers; ?>"><?php echo $text_customers; ?></a></li>
        	<li><a href="<?php echo $contacts; ?>"><?php echo $text_contacts; ?></a></li>
        	</ul>
        </li>

        <li><a class='parent'><?php echo $text_maint_service; ?></a>
			<ul>
      <li><a href=""><?php echo $text_skills; ?></a></li>
      <li><a href=""><?php echo $text_packagedsolutions; ?></a></li>

			</ul>
		</li>

        </ul>
      </li>
   <?php if ($admin == "Administrator") { ?>
  <li id="system"><a class="parent"><i class="fa fa-cogs"></i> <span><?php echo $text_system; ?></span></a>
    <ul>
      <li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
      <li><a class="parent"><?php echo $text_design; ?></a>
        <ul>
          <li><a href="<?php echo $layout; ?>"><?php echo $text_layout; ?></a></li>
          <li><a href="<?php echo $banner; ?>"><?php echo $text_banner; ?></a></li>
        </ul>
      </li>
      <li><a class="parent"><?php echo $text_users; ?></a>
        <ul>
          <li><a href="<?php echo $user; ?>"><?php echo $text_user; ?></a></li>
          <li><a href="<?php echo $user_group; ?>"><?php echo $text_user_group; ?></a></li>
          <li><a href="<?php echo $api; ?>"><?php echo $text_api; ?></a></li>
        </ul>
      </li>
      <li><a class="parent"><?php echo $text_localisation; ?></a>
        <ul>
          <li><a href="<?php echo $location; ?>"><?php echo $text_location; ?></a></li>
          <li><a href="<?php echo $currency; ?>"><?php echo $text_currency; ?></a></li>
          <li><a href="<?php echo $stock_status; ?>"><?php echo $text_stock_status; ?></a></li>
          <li><a href="<?php echo $order_status; ?>"><?php echo $text_order_status; ?></a></li>
          <li><a href="<?php echo $country; ?>"><?php echo $text_country; ?></a></li>
          <li><a href="<?php echo $zone; ?>"><?php echo $text_zone; ?></a></li>
          <li><a href="<?php echo $geo_zone; ?>"><?php echo $text_geo_zone; ?></a></li>
          <li><a class="parent"><?php echo $text_tax; ?></a>
            <ul>
              <li><a href="<?php echo $tax_class; ?>"><?php echo $text_tax_class; ?></a></li>
              <li><a href="<?php echo $tax_rate; ?>"><?php echo $text_tax_rate; ?></a></li>
            </ul>
          </li>
          <li><a href="<?php echo $length_class; ?>"><?php echo $text_length_class; ?></a></li>
          <li><a href="<?php echo $weight_class; ?>"><?php echo $text_weight_class; ?></a></li>
        </ul>
      </li>
    </ul>
  </li>
  <li id="tools"><a class="parent"><i class="fa fa-wrench fa-fw"></i> <span><?php echo $text_tools; ?></span></a>
    <ul>
      <li><a href="<?php echo $upload; ?>"><?php echo $text_upload; ?></a></li>
      <li><a href="<?php echo $backup; ?>"><?php echo $text_backup; ?></a></li>
      <li><a href="<?php echo $error_log; ?>"><?php echo $text_error_log; ?></a></li>


        </ul>
      </li>
    </ul>
  </li>
<?php } ?>

</ul>

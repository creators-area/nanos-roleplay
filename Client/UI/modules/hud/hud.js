document.addEventListener("DOMContentLoaded", function(event) {
	const body = document.querySelector(`body`);
	body.insertAdjacentHTML("afterbegin", `

		<div id="NanosRP_NameBox">
			<span class="material-symbols-outlined NanosRP_TextIcons">person</span>
			<p id="NanosRP_VarName" class="NanosRP_TextStat">Player.Name</p>
		</div>
		<div id="NanosRP_JobBox">
			<span class="material-symbols-outlined NanosRP_TextIcons">business_center</span>
			<p id="NanosRP_VarJobSalary" class="NanosRP_TextStat">Citizen - $0</p>
		</div>
		<div id="NanosRP_MoneyBox">
			<span class="material-symbols-outlined NanosRP_TextIcons">account_balance_wallet</span>
			<p id="NanosRP_VarJobSalary" class="NanosRP_TextStat">$0</p>
		</div>



		<span id="NanosRP_VarHealth">100</span>
		<div id="NanosRP_HealthBox">
			<div id="NanosRP_LimitBar">
				<div id="NanosRP_HealthBar">
				</div>
				<span class="material-symbols-outlined NanosRP_LifeSIcons">favorite</span>
			</div>
		</div>

		<span id="NanosRP_VarArmor">100</span>
		<div id="NanosRP_ArmorBox">
			<div id="NanosRP_LimitBar">
				<div id="NanosRP_ArmorBar">
				</div>
				<span class="material-symbols-outlined NanosRP_LifeSIcons">shield</span>
			</div>
		</div>

		<span id="NanosRP_VarFood">100</span>
		<div id="NanosRP_FoodBox">
			<div id="NanosRP_LimitBar">
				<div id="NanosRP_FoodBar">
				</div>
				<span class="material-symbols-outlined NanosRP_LifeSIcons">lunch_dining</span>
			</div>
		</div>

	`);
});



// Called at the init of player's UI
Events.Subscribe("NanosRP::InitVisual", function(name, health, armor) {
    $("#NanosRP_VarName").html(name);
	$("#NanosRP_VarHealth").html(health);
	$("#NanosRP_VarArmor").html(armor);
	document.getElementById( "NanosRP_HealthBar" ).style.setProperty( "--healthbar_height", (health / 100 ) )
	document.getElementById( "NanosRP_ArmorBar" ).style.setProperty( "--armorbar_height", ( armor / 100 ) )
});
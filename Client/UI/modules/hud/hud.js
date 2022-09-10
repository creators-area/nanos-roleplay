document.addEventListener("DOMContentLoaded", function(event) {
	const body = document.querySelector(`body`);
	body.insertAdjacentHTML("afterbegin", `

		<div id="NanosRP_NameBox">
			<i class='bx bx-user NanosRP_TextIcons'></i>
			<p id="NanosRP_VarName" class="NanosRP_TextStat">Player.Name</p>
		</div>
		<div id="NanosRP_JobBox">
			<i class='bx bx-briefcase NanosRP_TextIcons'></i>
			<p id="NanosRP_VarJobSalary" class="NanosRP_TextStat">Citizen - $0</p>
		</div>
		<div id="NanosRP_MoneyBox">
			<i class='bx bx-wallet NanosRP_TextIcons'></i>
			<p id="NanosRP_VarJobSalary" class="NanosRP_TextStat">$0</p>
		</div>



		<span id="NanosRP_VarHealth">100</span>
		<div id="NanosRP_HealthBox">
			<div id="NanosRP_LimitBar">
				<div id="NanosRP_HealthBar">
				</div>
				<i class='bx bx-heart NanosRP_LifeSIcons'></i>
			</div>
		</div>

		<span id="NanosRP_VarArmor">100</span>
		<div id="NanosRP_ArmorBox">
			<div id="NanosRP_LimitBar">
				<div id="NanosRP_ArmorBar">
				</div>
				<i class='bx bx-shield NanosRP_LifeSIcons'></i>
			</div>
		</div>

		<span id="NanosRP_VarFood">100</span>
		<div id="NanosRP_FoodBox">
			<div id="NanosRP_LimitBar">
				<div id="NanosRP_FoodBar">
				</div>
				<i class='bx bx-baguette NanosRP_LifeSIcons'></i>
			</div>
		</div>

	`);
});



// Called at the init of player's UI
Events.Subscribe("NanosRP::InitVisual", function(name, health, armor, money, job, jobSalary, hunger) {
    $("#NanosRP_VarName").html(name);
	$("#NanosRP_VarHealth").html(health);
	$("#NanosRP_VarArmor").html(armor);
	$("#NanosRP_VarMoney").html(money);
	$("#NanosRP_VarJobSalary").html(job + " - $" + jobSalary);
	$("#NanosRP_VarFood").html(Math.round(hunger));
	document.getElementById( "NanosRP_HealthBar" ).style.setProperty( "--healthbar_height", (health / 100))
	document.getElementById( "NanosRP_ArmorBar" ).style.setProperty( "--armorbar_height", (armor / 100))
	document.getElementById( "NanosRP_FoodBar" ).style.setProperty( "--foodbar_height", (hunger / 100))
});
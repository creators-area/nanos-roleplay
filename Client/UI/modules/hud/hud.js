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


		<div id="NanosRP_HealthBox">
			<div id="NanosRP_LimitBar">
				<div id="NanosRP_HealthBar">
					<i class='bx bx-heart NanosRP_LifeSIcons'></i>
					<span id="NanosRP_VarHealth" class="NanosRP_LifeSText">100</span>
				</div>
			</div>
		</div>

		<div id="NanosRP_ArmorBox">
			<div id="NanosRP_LimitBar">
				<div id="NanosRP_ArmorBar">
					<i class='bx bx-shield NanosRP_LifeSIcons'></i>
					<span id="NanosRP_VarArmor" class="NanosRP_LifeSText">100</span>
				</div>
			</div>
		</div>

		<div id="NanosRP_FoodBox">
			<div id="NanosRP_LimitBar">
				<div id="NanosRP_FoodBar">
					<i class='bx bx-baguette NanosRP_LifeSIcons'></i>
					<span id="NanosRP_VarFood" class="NanosRP_LifeSText">100</span>
				</div>
			</div>
		</div>

	`);
});



// Called at the init of player's UI
Events.Subscribe("NanosRP::InitVisual", function(name) {
    $("#NanosRP_VarName").html(name);
});
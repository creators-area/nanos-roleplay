document.addEventListener("DOMContentLoaded", function(event) {
	const body = document.querySelector(`body`);
	body.insertAdjacentHTML("afterbegin", `

		<div id="NanosRP_MainFrame">
			<div id="NanosRP_TopBar">
				<span id="NanosRP_Title">NanosRP - Inventory</span>
			</div>
			<div id="NanosRP_GridDiv">
				<button onclick="invMenu();"id="NanosRP_ItemDiv" invkey="1">
					<div id="NanosRP_ItemIcon">
						<img id="NanosRP_TypeImg" src="modules/inventory/images/weapon.png">
						<span id="NanosRP_ItemName">Ak-47</span>
					</div>
				</button>
				<button id="NanosRP_ItemDiv" invkey="2">
					<div id="NanosRP_ItemIcon">
						<img id="NanosRP_TypeImg" src="modules/inventory/images/food.png">
						<span id="NanosRP_ItemName">Hamburger</span>
					</div>
				</button>
				<div id="NanosRP_ItemDiv" invkey="3"></div>
				<div id="NanosRP_ItemDiv" invkey="4"></div>
				<div id="NanosRP_ItemDiv" invkey="5"></div>
				<div id="NanosRP_ItemDiv" invkey="6"></div>
				<div id="NanosRP_ItemDiv" invkey="7"></div>
				<div id="NanosRP_ItemDiv" invkey="8"></div>
				<div id="NanosRP_ItemDiv" invkey="9"></div>
				<div id="NanosRP_ItemDiv" invkey="10"></div>
				<div id="NanosRP_ItemDiv" invkey="11"></div>
				<div id="NanosRP_ItemDiv" invkey="12"></div>
				<div id="NanosRP_ItemDiv" invkey="13"></div>
				<div id="NanosRP_ItemDiv" invkey="14"></div>
				<div id="NanosRP_ItemDiv" invkey="15"></div>
				<div id="NanosRP_ItemDiv" invkey="16"></div>
				<div id="NanosRP_ItemDiv" invkey="17"></div>
				<div id="NanosRP_ItemDiv" invkey="18"></div>
			</div>
		</div>

	`);
});

function invMenu(){
    const btn = document.getElementById("NanosRP_ItemDiv");
	const invkey = btn.getAttribute("invkey");
	alert(invkey);
};
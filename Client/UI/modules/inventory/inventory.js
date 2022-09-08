document.addEventListener("DOMContentLoaded", function(event) {
	const body = document.querySelector(`body`);
	body.insertAdjacentHTML("afterbegin", `

		<div id="NanosRP_MainFrame">
			<div id="NanosRP_TopBar">
				<span id="NanosRP_Title">NanosRP - Inventory</span>
			</div>
			<div id="NanosRP_GridDiv">
				<div invkey="1">
					<div id="NanosRP_ItemIcon">
					</div>
				</div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
				<div invkey="1"></div>
			</div>
		</div>

	`);
});

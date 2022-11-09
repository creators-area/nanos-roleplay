document.addEventListener("DOMContentLoaded", function(event) {
	const body = document.querySelector(`body`);
	body.insertAdjacentHTML("afterbegin", `

		<div id="NanosRP_Scb" class="hero">
			<div class="top">
				<h1>Scoreboard Menu</h1>
			</div>
			<div class="ply_tbl">
				<table class="table">
					<thead>
						<tr>
							<th>Nom Rôleplay</th>
							<th>Métier</th>
							<th>Ping</th>
						</tr>
                	</thead>
                    <tbody id="scb_plyinfo">
                    </tbody>
                </table>			  
			</div>
		</div>

	`);
});

function NanosScbAddPly(name, job, ping) {
	const nanostbl = document.querySelector("#scb_plyinfo");

	const scb_ply_tr = document.createElement("tr");
	scb_ply_tr.id = `scb_ply_infos`;

	const scb_td_name = document.createElement("td");
	scb_td_name.className = "scb_name";
	scb_td_name.innerHTML = name;
	scb_ply_tr.appendChild(scb_td_name);
	
	const scb_td_job = document.createElement("td");
	scb_td_job.className = "scb_job";
	scb_td_job.innerHTML = job;
	scb_ply_tr.appendChild(scb_td_job);
	
	const scb_td_ping = document.createElement("td");
	scb_td_ping.className = "scb_ping";
	scb_td_ping.innerHTML = ping;
	scb_ply_tr.appendChild(scb_td_ping);

	nanostbl.prepend(scb_ply_tr);
}

function NanosScbRemovePlys(){
	const nanos_ply_parent = document.querySelector("#scb_plyinfo");
	while (nanos_ply_parent.firstChild) {
		nanos_ply_parent.removeChild(nanos_ply_parent.lastChild);
	}
}


Events.Subscribe("NanosRP:RemovePlayers", NanosScbRemovePlys);
Events.Subscribe("NanosRP:AddPlayer", NanosScbAddPly);
// @stimulus-components/confirmation@1.0.1 downloaded from https://ga.jspm.io/npm:@stimulus-components/confirmation@1.0.1/dist/stimulus-confirmation.mjs

import{Controller as t}from"@hotwired/stimulus";const e=class _Confirmation extends t{check(){const t=this.inputTargets.some((t=>t.type==="checkbox"?t.checked===!1:t.dataset.confirmationContent!==t.value));this.itemTargets.forEach((e=>{e.disabled=t}))}inputTargetConnected(){this.check()}inputTargetDisconnected(){this.check()}};e.targets=["input","item"];let i=e;export{i as default};


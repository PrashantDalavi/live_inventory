$(document).ready(function($) {
	$('#accordion').dcAccordion({
		eventType: 'click',
		autoClose: true,
		saveState: true,
		disableLink: true,
		speed: 400,
		showCount: false,
		autoExpand: true,
		cookie	: 'dcjq-accordion-1',
		classExpand	 : 'dcjq-current-parent'
	});
});
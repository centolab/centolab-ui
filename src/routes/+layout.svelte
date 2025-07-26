<script lang="ts">
	import '$lib/styles/spacing.scss';
	import '$lib/styles/style.css';
	import '$lib/styles/responsive.css';

	import { onMount } from 'svelte';
	import { browser } from '$app/environment';

	onMount(() => {
		if (browser) {
			import('aos').then((AOS) => {
				AOS.default.init({
					offset: 40,
					duration: 1000,
					easing: 'ease'
				});
			});
		}
	});
</script>

<slot />

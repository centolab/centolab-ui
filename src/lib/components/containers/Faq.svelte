<script lang="ts">
	let faqs = [
		{
			question: 'Quanto costa un sito web?',
			answer: 'I costi variano in base a complessità e funzionalità richieste. Siti vetrina base partono da un investimento contenuto, mentre soluzioni personalizzate richiedono budget più importanti. Durante la prima consulenza gratuita, dopo aver compreso le tue esigenze, ti forniremo un preventivo trasparente e su misura.',
			id: 'costi'
		},
		{
			question: 'Il sito si vedrà bene su cellulare?',
			answer:
				'Assolutamente sì. Testiamo su tutti i dispositivi prima della consegna. Se non si visualizza perfettamente, lo sistemiamo gratis.',
			id: 'mobile'
		},
		{
			question: 'Il sito sarà ottimizzato per la ricerca?',
			answer: 'Tutti i nostri siti hanno struttura SEO-friendly di base, caricamento veloce e adattamento mobile perfetto. Per strategie avanzate possiamo integrare strumenti specifici.',
			id: 'seo'
		},
		{
			question: 'Quanto tempo ci vuole per realizzare un sito web?',
			answer: 'Dipende dalla complessità del progetto. In media, un sito vetrina richiede 2-4 settimane, mentre applicazioni più complesse possono richiedere 6-8 settimane o più.',
			id: 'tempi'
		},
		{
			question: 'Posso aggiornare il sito da solo dopo la consegna?',
			answer: 'Sì, forniamo documentazione e formazione per permetterti di gestire autonomamente i contenuti. Offriamo anche supporto continuativo se necessario.',
			id: 'aggiornamenti'
		},
		{
			question: 'Fornisci assistenza tecnica dopo il lancio?',
			answer: 'Assolutamente sì. Ogni progetto include un periodo di assistenza post-lancio, con tempi di risposta garantiti. Successivamente possiamo concordare un piano di supporto continuativo.',
			id: 'assistenza'
		},
		{
			question: 'Cosa succede se ho bisogno di modifiche future?',
			answer: 'Tutti i nostri progetti vengono consegnati con documentazione chiara e sono pensati per essere facilmente modificabili. Offriamo anche pacchetti di aggiornamento su misura.',
			id: 'modifiche'
		},
		{
			question: 'Come posso richiedere un preventivo personalizzato?',
			answer: 'Puoi richiedere un preventivo direttamente dal nostro sito o contattandoci via email. Ti risponderemo entro 24 ore con una proposta dettagliata.',
			id: 'preventivo'
		},
		{
			question: 'Come gestisci la sicurezza dei dati?',
			answer: 'Implementiamo sempre protocolli di sicurezza base avanzati, backup automatizzati e aggiornamenti regolari. Per progetti particolari possiamo aggiungere livelli extra di protezione.',
			id: 'sicurezza'
		}
	];
</script>

<section id="faqs" class="any-questions-area section-padding">
	<div class="container">
		<div class="row">
			<div class="col-xl-12 col-lg-12">
				<div class="section-title text-center wow fadeInUp delay-0-2s">
					<h3><i class="ri-arrow-right-up-line"></i> FAQs</h3>
					<h2>Frequently Asked Questions</h2>
					<p>Ecco le risposte alle domande più comuni sui nostri servizi web</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="book-call-intro text-center">
					
					<h2>Cosa aspetti?</h2>
					<a href="/" class="theme-btn">Chiedi un preventivo</a>
					<p>Preferisci le e-mail? <a href="mailto:giacomo@centolab.it">giacomo@centolab.it</a></p>
				</div>
			</div>
			<div class="col-lg-8 col-md-6">
				<div class="accordion accordion-flush" id="accordionFlushExample">
					{#each faqs as faq (faq.id)}
						<div class="accordion-item">
							<h2 class="accordion-header" id={faq.id}>
								<button
									class="accordion-button collapsed"
									type="button"
									data-bs-toggle="collapse"
									data-bs-target="#{faq.id}Content"
									aria-expanded="false"
									aria-controls="{faq.id}Content"
								>
									{faq.question}
								</button>
							</h2>
							<div
								id="{faq.id}Content"
								class="accordion-collapse collapse"
								data-bs-parent="#accordionFlushExample"
							>
								<div class="accordion-body">
									<p>{faq.answer}</p>
								</div>
							</div>
						</div>
					{/each}
				</div>
			</div>
		</div>
	</div>
</section>

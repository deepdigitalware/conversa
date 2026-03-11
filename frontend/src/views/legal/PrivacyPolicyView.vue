<script setup lang="ts">
const effectiveDate = 'March 11, 2026'
</script>

<template>
  <div class="min-h-screen bg-background text-foreground flex items-center">
    <main class="mx-auto w-full max-w-4xl px-6 py-12">
      <h1 class="text-3xl font-bold tracking-tight">Privacy Policy</h1>
      <p class="mt-1 text-sm text-muted-foreground">Effective date: {{ effectiveDate }}</p>

      <section class="mt-8 space-y-3">
        <h2 class="text-xl font-semibold">1. Information We Collect</h2>
        <p class="text-sm leading-6 text-muted-foreground">We collect business account details, customer communication data, message templates, campaign metrics, and account settings necessary to operate WhatsApp Business messaging features.</p>
      </section>

      <section class="mt-6 space-y-3">
        <h2 class="text-xl font-semibold">2. How We Use Information</h2>
        <p class="text-sm leading-6 text-muted-foreground">Data is used to deliver messaging workflows, manage templates and campaigns, provide analytics, support account administration, and improve reliability and security of the service.</p>
      </section>

      <section class="mt-6 space-y-3">
        <h2 class="text-xl font-semibold">3. Data Sharing</h2>
        <p class="text-sm leading-6 text-muted-foreground">We do not sell personal data. Data may be shared only with required infrastructure providers and Meta/WhatsApp APIs to deliver requested functionality.</p>
      </section>

      <section class="mt-6 space-y-3">
        <h2 class="text-xl font-semibold">4. Data Retention</h2>
        <p class="text-sm leading-6 text-muted-foreground">Data is retained only as long as required for business operations, legal obligations, and service continuity. Users may request deletion as described on our User Data Deletion page.</p>
      </section>

      <section class="mt-6 space-y-3">
        <h2 class="text-xl font-semibold">5. Security</h2>
        <p class="text-sm leading-6 text-muted-foreground">We apply technical and organizational controls such as authenticated access, role-based authorization, and secured transport where applicable.</p>
      </section>

      <section class="mt-6 space-y-3">
        <h2 class="text-xl font-semibold">6. Contact</h2>
        <p class="text-sm leading-6 text-muted-foreground">For privacy questions, contact: <a class="underline underline-offset-4" href="mailto:deepversestudio@gmail.com">deepversestudio@gmail.com</a></p>
      </section>
    </main>
  </div>
</template>

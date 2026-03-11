<script setup lang="ts">
const effectiveDate = 'March 11, 2026'
</script>

<template>
  <div class="min-h-screen bg-background text-foreground flex items-center">
    <main class="mx-auto w-full max-w-4xl px-6 py-12">
      <h1 class="text-3xl font-bold tracking-tight">User Data Deletion Instructions</h1>
      <p class="mt-1 text-sm text-muted-foreground">Last updated: {{ effectiveDate }}</p>

      <section class="mt-8 space-y-3">
        <h2 class="text-xl font-semibold">How to Request Deletion</h2>
        <p class="text-sm leading-6 text-muted-foreground">To request deletion of your data associated with this app, send an email to <a class="underline underline-offset-4" href="mailto:deepversestudio@gmail.com">deepversestudio@gmail.com</a> with subject line <strong>"Data Deletion Request"</strong>.</p>
      </section>

      <section class="mt-6 space-y-2">
        <h2 class="text-xl font-semibold">Please Include</h2>
        <ul class="list-disc pl-5 text-sm leading-6 text-muted-foreground space-y-1">
          <li>Your full name</li>
          <li>Your phone number used for WhatsApp communication</li>
          <li>Your relationship to the business (customer/user)</li>
          <li>Any additional identifiers that help us locate your records</li>
        </ul>
      </section>

      <section class="mt-6 space-y-3">
        <h2 class="text-xl font-semibold">Processing Timeline</h2>
        <p class="text-sm leading-6 text-muted-foreground">We will acknowledge requests and process eligible deletions within a reasonable timeframe, typically within 30 days, subject to legal and compliance requirements.</p>
      </section>

      <section class="mt-6 space-y-3">
        <h2 class="text-xl font-semibold">Scope of Deletion</h2>
        <p class="text-sm leading-6 text-muted-foreground">Upon verification, we will delete or anonymize personal data we control, except data required to be retained for legal, security, fraud prevention, or audit obligations.</p>
      </section>
    </main>
  </div>
</template>

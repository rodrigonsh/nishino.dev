<script setup>

import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';

const props = defineProps({
    projetos: Array,
    errors: Array,
});

</script>

<template>
    <Head title="Área do Cliente" />

    <AuthenticatedLayout title="Área do Cliente">
        
        <v-container class="w-100 pa-7 bg-dialog">
            <h1>Área do Cliente</h1>
            <h3>Resumo de dashboard</h3>
        </v-container>

        <v-container>
        
            <v-card
                v-for="proj in projetos"
                :title="proj.nome" 
                :subtitle="proj.status" 
                class="mb-9" 
                prepend-icon="mdi-radiobox-marked">
                
                <v-card-text>{{ proj.briefing }}</v-card-text>
                
                <v-card-actions>
                    <v-btn>Detalhar</v-btn>
                    <v-btn>Conversar</v-btn>
                </v-card-actions>
            </v-card>

            <v-card title="FATURAMENTO" subtitle="JULHO 2024" prepend-icon="mdi-radiobox-marked">
                
                <v-card-text>
                    <h1>R$ 49.00</h1>
                </v-card-text>
                
                <v-card-actions>
                    <v-btn>PAGAR</v-btn>
                    <v-btn>Conversar</v-btn>
                </v-card-actions>
                
            </v-card>
        
        </v-container>


    </AuthenticatedLayout>
</template>

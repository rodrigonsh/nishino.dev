<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { Head, Link } from '@inertiajs/vue3';
import api from '@/api'

const props = defineProps({
    cliente: Object,
    projetos: Array,
    errors: Array,
});

</script>

<template>
    <Head title="LEAD" />

    <AdminLayout title="LEAD">

        <v-container>
        
        <v-row>
        
            <v-col class="flex-grow-1">
                <h1>{{ cliente.name }} ({{ cliente.email }})</h1>
            </v-col>    

            <v-col class="flex-grow-0 flex-shrink-1">
               
                <v-btn
                    prepend-icon="mdi-account"
                    append-icon="mdi-menu-down"
                    @click="teste"
                >

                    Ações
            
                    <v-menu offset-y activator="parent">
                        
                        <v-list>

                            <v-list-item  prepend-icon="mdi-thumb-up">
                                Conversar com Donna sobre o
                            </v-list-item>
                        
                        </v-list>

                    </v-menu>

                </v-btn>
            </v-col>

        </v-row>


        <pre code>{{ cliente.map }}</pre>

        oie
        <div class="y-3" v-for="proj in props.projetos">

            <Link class="text-black" :href="'/admin/clientes/'+cliente.id+'/projeto/'+proj.id">

                <small>HAKUNA MATATA</small>
                <h3>{{ proj.nome  }}</h3>
                <p>{{ proj.briefing }}</p>

            </Link>

        </div>

        </v-container>

    </AdminLayout>
</template>

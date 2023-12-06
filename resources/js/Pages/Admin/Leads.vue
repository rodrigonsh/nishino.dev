<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { Head, Link } from '@inertiajs/vue3';
import { onMounted } from 'vue';

const props = defineProps({
    leads: Array,
    errors: Array,
});

</script>

<template>
    <Head title="Dashboard" />

    <AdminLayout title="DASHBOARD">
        

        <v-container class='w-100 pa-7 bg-dialog'>
            <h1>Leads em aberto</h1>
        </v-container>
        
        
        
        <v-container class="pa-7">
            

            <div class="y-3" v-for="lead in props.leads">

                <Link class="text-black" :href="'/admin/leads/'+lead.id">

                <small>Data:{{ lead.date_diff }}</small>
                <h3>{{ lead.name  }}</h3>
                <p>{{ lead.email }}</p>

                </Link>
            </div>

        </v-container>

    </AdminLayout>
</template>

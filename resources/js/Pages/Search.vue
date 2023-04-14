<script>
export default
{
    data: () => ({
        panelIndex: -1,
        loading: false,
        chain: null
    }),
    watch: {
        panelIndex: function() {

            if ( this.panelIndex != 1 ) return;
            
            this.loading = true;

            let xhr = new XMLHttpRequest();
            xhr.onload = function(){

                this.chain = JSON.parse(xhr.responseText)
                this.loading = false;

            }.bind(this)

            xhr.open("get", route('chain', this.result.name))
            xhr.send()

        }
    }
}


</script>

<script setup>

import {Head, Link} from '@inertiajs/vue3';

import GuestLayout from '@/Layouts/GuestLayout.vue';

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
    result: Object
});

</script>

<template>
    
    <GuestLayout canLogin="canRegister" canRegister="canRegister" title="Resultados">
    
        <Head title="Resultados" />

        <v-card id="searchResult" class="pa-6">
            
            <v-row>
                <v-col class="d-flex justify-center">
                    
                    <v-avatar 
                        :image="result.sprites.other.dream_world.front_default" 
                        size="200"
                    ></v-avatar>
                    
                </v-col>

                <v-col>

                    <h1>{{ result.name }}</h1>

                    <v-row class="mb-3">
                        <v-col>
                            <v-chip>{{ result.types[0].type.name }}</v-chip>
                            <v-chip>#{{ result.id }}</v-chip>
                        </v-col>
                    </v-row>

                    <p class="mb-3">
                        <strong>Altura: </strong>
                        {{  result.height  }}
                        /
                        <strong>Peso: </strong>
                        {{  result.weight  }}

                     </p>

                    <v-expansion-panels>

                        <v-expansion-panel>
                            <v-expansion-panel-title>
                                STATS
                            </v-expansion-panel-title>
                            <v-expansion-panel-text>
                            
                                <v-row v-for="stat in result.stats">
                                    <v-col>
                                        <p>{{ stat.stat.name  }}</p>
                                        <v-progress-linear :model-value="stat.base_stat"></v-progress-linear>
                                    </v-col>
                                </v-row>

                            </v-expansion-panel-text>
                        </v-expansion-panel>

                    </v-expansion-panels>

                </v-col>

            </v-row>

            <v-row>
                <v-col>

                    <v-expansion-panels v-model="panelIndex">

                        <v-expansion-panel>

                            <v-expansion-panel-title>
                                Moves
                            </v-expansion-panel-title>
                            <v-expansion-panel-text>
                            
                                <v-chip v-for="move in result.moves" class="ma-1">
                                    {{ move.move.name }}
                                </v-chip>

                            </v-expansion-panel-text>
                        </v-expansion-panel>

                        <v-expansion-panel>

                            <v-expansion-panel-title>
                                Evolution
                            </v-expansion-panel-title>
                            <v-expansion-panel-text>

                                <div v-if="loading" class="d-flex justify-center">
                                    <v-progress-circular indeterminate></v-progress-circular>
                                </div>

                                <v-row v-else>
                                    <v-col v-for="pokemon in chain">
                                        <v-sheet
                                        
                                            class="rounded-xl mx-auto d-flex flex-column align-center pa-2"
                                            color="grey-lighten-3"

                                        >
                                            <img class="d-block" :src="pokemon.sprites.front_default" />
                                            <p>{{pokemon.name}}</p>
                                        </v-sheet>
                                    </v-col>
                                </v-row>

                            </v-expansion-panel-text>
                        </v-expansion-panel>

                    </v-expansion-panels>

                    
                </v-col>
            </v-row>

            <div class="d-flex justify-end py-5">
                <Link href="/">
                    <v-btn prepend-icon="mdi-arrow-left" color="primary">
                    Voltar  
                    </v-btn>
                </Link>
            </div>

        </v-card>


 
        
        
</GuestLayout>

</template>

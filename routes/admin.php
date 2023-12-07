<?php

use App\Http\Controllers\Admin\AdminClientes;
use App\Http\Controllers\Admin\AdminDocumentos;
use App\Http\Controllers\Admin\AdminDonna;
use App\Http\Controllers\Admin\AdminFinanceiro;
use App\Http\Controllers\Admin\AdminHome;
use App\Http\Controllers\Admin\AdminLeads;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;


Route::middleware(['auth', 'verified'])->group(function () {
    
    Route::get('/admin', [AdminHome::class, 'index'])->name('admin.home');

    Route::get('/admin/leads', [AdminLeads::class, 'index'])->name('admin.leads');
    Route::get('/admin/leads/{id}', [AdminLeads::class, 'view'])->name('admin.lead.view');
    Route::get('/admin/leads/{id}/converter', [AdminLeads::class, 'converter'])->name('admin.lead.view');
    Route::get('/admin/leads/{id}/descartar', [AdminLeads::class, 'descartar'])->name('admin.lead.view');

    Route::get('/admin/clientes', [AdminClientes::class, 'index'])->name('admin.clientes');
    Route::get('/admin/clientes/{id}', [AdminClientes::class, 'view'])->name('admin.clientes.view');

    Route::get('/admin/donna', [AdminDonna::class, 'index'])->name('admin.donna');

    Route::get('/admin/financeiro', [AdminFinanceiro::class, 'index'])->name('admin.financeiro');
    
    Route::get('/admin/docs', [AdminDocumentos::class, 'index'])->name('admin.documentos');


});
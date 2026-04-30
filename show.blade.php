@extends('layouts.app')

@section('title', $product->name . ' - HachiPetShop')

@section('content')
<div class="container py-5 mt-5">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('products.index') }}">Produk</a></li>
            <li class="breadcrumb-item active" aria-current="page">{{ $product->name }}</li>
        </ol>
    </nav>

    <div class="row">
        <div class="col-md-6 mb-4">
            <img src="{{ $product->image_url ?? 'https://via.placeholder.com/500x400?text=Product' }}" 
                 class="img-fluid rounded shadow" alt="{{ $product->name }}">
        </div>
        <div class="col-md-6">
            <h1 class="display-6 fw-bold">{{ $product->name }}</h1>
            <p class="text-muted">Kategori: {{ ucfirst($product->category) }}</p>
            <div class="h2 text-primary mb-3">{{ $product->formatted_price }}</div>
            <div class="mb-4">
                <p>{{ $product->description }}</p>
            </div>
            @if($product->barcode)
                <div class="mt-4">
                    <small class="text-muted">Barcode: {{ $product->barcode }}</small>
                </div>
            @endif
        </div>
    </div>

    @if($related->count())
        <hr class="my-5">
        <h3 class="mb-4">Produk Terkait</h3>
        <div class="row">
            @foreach($related as $rel)
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card h-100 shadow-sm">
                        <img src="{{ $rel->image_url ?? 'https://via.placeholder.com/150x150?text=Product' }}" 
                             class="card-img-top" alt="{{ $rel->name }}" style="height: 150px; object-fit: cover;">
                        <div class="card-body">
                            <h6 class="card-title">{{ $rel->name }}</h6>
                            <p class="card-text text-primary">{{ $rel->formatted_price }}</p>
                            <a href="{{ route('products.show', $rel->slug) }}" class="btn btn-sm btn-outline-primary">Lihat</a>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    @endif
</div>
@endsection
# SPAR_TEST

## Description
#### Данное приложение является тестовым. 
#### Включает в себя сцены:
##### * "CategoryScene",

## Getting started
#### Для дальнейшей работы, необходимо скачать архив или клонировать проект с ресурса GitHub.
#### Разархивировать.
#### Открыть папку с проектом и запустить файл SPAR-TEST.xcodeproj

## Usage
####

## Architecture
#### В данном проекте используется архитектура MVVM (Одна сцена координатор не добавлял).

## Structure
### Current structure 
### (Отображение структуры в GitHub не соответствует структуре в проекте, ниже приведена файловая структура проекта)

``` bash
└── SPAR_TEST
     ├── README.md
     ├── swiftlint.yml
     └── SPAR_TEST
        ├── Application
        │   └── SPARTESTApp.swift
        ├── Enums
        │   └── Units.swift
        ├── Extensions
        │   └── Extension+Color.swift
        ├── Flows
        │   ├── CommonView
        │   │   └── BackgroundView.swift
        │   ├── MainFlow
		│   │   ├── ContentView.swift
		│   │   └── CategoryScene
        │   │   	├── AssemblerCategoryScene.swift
        │   │   	├── CategoryIterator.swift
        │   │   	├── CategoryModel.swift
        │   │   	├── CategoryView.swift
        │   │   	├── CategoryViewModel.swift
        │   │   	└── CategoryWorker.swift
        │   ├── Views
		│   │   └── Cells
        │   │   	├── CategoryListCell.swift
        │   │   	├── CategoryTileCell.swift
        │   │    	└── CommonViews
        │   │   		├── CountryView.swift
        │   │   		├── HeaderAddProduct.swift
        │   │   		├── OrderLikeButtons.swift
        │   │   		├── PriceAndButtonBuy.swift
        │   │   		└── PromotionView.swift
        ├── GlobalStyles
        │   ├── GlobalColor.swift
        │   ├── GlobalFonts.swift
        │   ├── GlobalImage.swift
        │   └── GlobalSize.swift
        ├── Managers
        │   ├── DecodeJsonManager.swift
        │   └── LoadFileManager.swift
        ├── Mocks
        │   ├── MockProduct.swift
        │   └── MockProductList.json
        ├── Preview Content
       	│   └── Preview Assets.xcassets
        │       └── TabBarScene
        ├── Resourses
        │   ├── Fonts
        │   └──  Assets.xcassets
        └── Services
            └── SDeclinationNumberService.swift
```

## Running the tests

## Dependencies
#### Pod - Нет.

## Workflow
#### App version: 16.0 (BETA)
#### iOS version: 17.0

## Design
#### Дизайн для приложения выполнен в Figma.
#### [Figma](https://www.figma.com/design/1VrYJ62cSC7yFJWsuUD3xa/Spar-Intern-Task?node-id=0-1&t=SuQD6RjUqoX4pPUF-1)

## Task boards
#### 

## API
#### В приложении нет используются API:


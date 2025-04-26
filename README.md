# CoreData Tabanlı To-Do Listesi Uygulaması

Bu proje, UIKit ve Core Data kullanılarak oluşturulmuş basit bir yapılacaklar listesi (To-Do List) uygulamasıdır. Uygulama sayesinde kullanıcılar yeni görevler ekleyebilir, detaylarını görüntüleyebilir ve dilerlerse silebilirler. Tüm veriler Core Data kullanılarak kalıcı olarak saklanmaktadır.

## Özellikler

- Başlık ve açıklama içeren yeni görevler ekleme
- Görev detaylarını yeni bir sayfada görüntüleme
- Görevleri silme (swipe-to-delete özelliği)
- Core Data ile otomatik veri kaydı

## Mimarisi

Uygulama aşağıdaki yapı ve prensipleri kullanır:

- **Core Data**: Kalıcı veri saklama için
- **UITableView**: Listeleme için
- **UIViewController**: Ekran yönetimi
- **UINavigationController**: Ekranlar arası geçiş

## Kurulum

1. Reposity'i klonlayın:
   ```bash
   git clone (https://github.com/Aslan049/iOS-CoreData-ToDoApp.git)

#include "image_item.hpp"
#include <QDir>

ImageItem::ImageItem(QQuickItem* parent) : QQuickPaintedItem(parent)
{
    qDebug() << "Lienzo created.";

    content_ = QImage(":/images/assets/uv-grid-color.png");
    update();
    int x = 0;
}

void ImageItem::paint(QPainter* painter)
{
    qDebug() << "In Lienzo->paint()";
    painter->drawImage(QRectF{ 0.,0.,
                               static_cast<double>(content_.width()),
                               static_cast<double>(content_.height()) }
                       , content_);
}

void ImageItem::openImage(const QString path)
{
    qDebug() << "Current dir is:" << QDir::currentPath();
    qDebug() << "Opening path: " << path;
    content_ = QImage("./assets/PM5544_with_non-PAL_signals.png");
    int x = content_.width();
    qDebug() << x;
    update();
}

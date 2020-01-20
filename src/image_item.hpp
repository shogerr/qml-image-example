#ifndef CANVAS_HPP
#define CANVAS_HPP

#include <QImage>
#include <QObject>
#include <QPainter>
#include <QQuickPaintedItem>
#include <QQuickItem>

#include <filesystem>

class ImageItem : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QImage image READ image)
public:
    ImageItem(QQuickItem *parent = nullptr);
    QImage image() const { return content_; }
    Q_INVOKABLE void openImage(QString path);
    void paint(QPainter *painter);
private:
    QImage content_;
};
#endif


#ifndef COMMON_QML_PLUGIN_H
#define COMMON_QML_PLUGIN_H

//#include "maidsafe/common/crypto.h"
//#include "maidsafe/common/utils.h"
//#include "maidsafe/common/rsa.h"

#include <QtQml/qqml.h>

void registerQmlTypes()
{
    QLatin1String uri("QtCommon");

 //  qmlRegisterUncreatableType<maidsafe::rsa::Keys>(uri.latin1(), 1, 0, "RsaKey", QLatin1String("Use the Context property instead."));

//  qmlRegisterType<maidsafe::rsa::Keys>(uri.latin1(), 1, 0, "CpuSize");
//    qmlRegisterType<maidsafe::RandomInt32>(uri.latin1(), 1, 0, "RandomInt32");
}
// see here http://stackoverflow.com/questions/9500280/qt-access-c-function-from-qml
#endif // COMMON_QML_PLUGIN_H

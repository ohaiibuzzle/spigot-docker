#/bin/sh
if [ ! -f spigot.jar ]; then
    cp -fv /img/spigot.jar .
fi
if [ ! -f "eula.txt" ]; then 
    echo "eula=true" > eula.txt
fi
java -jar -Xmx2G -XX:+CMSIncrementalPacing -XX:+CMSClassUnloadingEnabled \
            -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 \
            -XX:MaxHeapFreeRatio=10 \
            /mc/spigot.jar

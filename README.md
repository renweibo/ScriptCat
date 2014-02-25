#ScriptCat

One script plugin framework for better work.

# Usage

## BootStrap

~~~bash
git clone https://github.com/renweibo/ScriptCat.git mywork
cd mywork
ln -s ScriptCat.sh superman.sh
./superman.sh usage
./superman.sh check
~~~

## Add simple plugin

~~~bash
export Plugin_Name=sample
cp bin/bin_dummy.sh bin/${Plugin_Name}.sh
sed -i s/bin_dummy/${Plugin_Name}/g bin/${Plugin_Name}.sh
sed -i s/Dummy/${Plugin_Name}/g bin/${Plugin_Name}.sh
sed -i s/dummy/${Plugin_Name}/g bin/${Plugin_Name}.sh
./superman.sh ${Plugin_Name} 
./superman.sh ${Plugin_Name} none
./superman.sh ${Plugin_Name} ${Plugin_Name}
~~~


# Add plugin suite
~~~
export Plugin_Name=sample
cp -r bin/plugin_dummy bin/${Plugin_Name}
find bin/${Plugin_Name} -type f -exec sed -i s/plugin_dummy/${Plugin_Name}/g {} \;
find bin/${Plugin_Name} -type f -exec sed -i s/Dummy/${Plugin_Name}/g {} \;
find bin/${Plugin_Name} -type f -exec sed -i s/dummy/${Plugin_Name}/g {} \;
./superman.sh ${Plugin_Name} 
./superman.sh ${Plugin_Name} none
./superman.sh ${Plugin_Name} ${Plugin_Name}
~~~

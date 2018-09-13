Since a parameter maybe stored in different namespaces there is a path to reach a particualr parameter. 

The parameter path is defined by a collection of strings, AKA the chains of namespaces to follow in order to reach the parameter. And finally a parameter name. 

This object is meant to fetch information from a namespace, diving on it and fetch the needed parameter. 

all the public methods are mean to be executed with the root namespace in order to reach the goal. 